import 'package:authentication/authentication.dart';
import 'package:authentication/src/domain/repository/mock_auth_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:util/util.dart';

@lazySingleton
class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  final AuthRepository _authApiRepository;
  final SessionRepository _sessionRepository;

  AuthUserBloc(this._authApiRepository, this._sessionRepository)
    : super(AuthUserStateInitial()) {
    on<AuthUserEvent>((event, emit) async {
      await switch (event) {
        AutoLogin() => _loginWithToken(event, emit),

        Logout() => _logout(event, emit),

        SessionExpired() => _sessionExpired(event, emit),

        SendOTP() => _sendOTP(event, emit),
        VerifyOTP() => _unifiedVerifyOTP(event, emit),
        UpdateProfile() => _updateUserProfile(event, emit),

        LoginWithPin() => _loginWithPin(event, emit),
      };
    });
  }

  Future<void> _loginWithToken(
    AutoLogin event,
    Emitter<AuthUserState> emit,
  ) async {
    emit(AuthUserStateLoading());
    final result = await ResultAsync.fromAsync(_sessionRepository.getSession);
    result.fold(
      (session) {
        if (session == null) {
          emit(AuthUserStateInitial());
        } else {
          emit(
            AuthUserStateAuthenticated(
              session: session,
              context: AuthenticationContext.tokenLogin,
            ),
          );
        }
      },
      (error) {
        emit(
          AuthUserStateError(
            APIException.error(error.toString()),
            AuthUserErrorStateType.loginWithToken,
          ),
        );
      },
    );
  }

  Future<void> _logout(Logout event, Emitter<AuthUserState> emit) async {
    emit(AuthUserStateLoading());

    final refreshToken = await _sessionRepository.getRefreshToken();

    final result = await ResultAsync.fromAsync(_sessionRepository.clearSession);

    if (refreshToken != null && refreshToken.isNotEmpty) {
      MockAuthRepository().logout(refreshToken).ignore();
    }

    result.fold(
      (data) => emit(AuthUserStateLoggedOut()),
      (error) => emit(
        AuthUserStateError(
          APIException.error(error.toString()),
          AuthUserErrorStateType.logout,
        ),
      ),
    );
  }

  Future<void> _sessionExpired(
    SessionExpired event,
    Emitter<AuthUserState> emit,
  ) async {
    await _sessionRepository.clearSession();
    emit(AuthUserStateSessionExpired());
  }

  Future<void> _updateUserProfile(
    UpdateProfile event,
    Emitter<AuthUserState> emit,
  ) async {
    emit(AuthUserStateLoading());

    final userResult = await ResultAsync.fromAsync(_sessionRepository.getUser);
    final userId = userResult.fold((user) => user?.id, (error) => null);

    if (userId == null) {
      emit(
        AuthUserStateError(
          APIException.error('User session not found'),
          AuthUserErrorStateType.saveProfile,
        ),
      );
      return;
    }

    final response = await MockAuthRepository().updateUserProfile(
      userId: userId,
      profileData: event.profileData,
    );

    await response.fold(
      (updatedUser) async {
        await _sessionRepository.updateUser(updatedUser);
        await _emitAuthenticatedState(
          emit,
          AuthenticationContext.profileSave,
          AuthUserErrorStateType.saveProfile,
        );
      },
      (error) {
        emit(AuthUserStateError(error, AuthUserErrorStateType.saveProfile));
      },
    );
  }

  Future<void> _sendOTP(SendOTP event, Emitter<AuthUserState> emit) async {
    emit(AuthUserStateLoading());

    final response = await MockAuthRepository().sendOTP(event.request);
    emit(
      response.fold(
        (data) => AuthUserStateOTPSent(
          sessionId: data.id,
          identifier: event.request.phone ?? event.request.email ?? '',
          userType: data.userType, // Capture "new" or "returning" from backend
        ),
        (error) => AuthUserStateError(error, AuthUserErrorStateType.sendOTP),
      ),
    );
  }

  Future<void> _unifiedVerifyOTP(
    VerifyOTP event,
    Emitter<AuthUserState> emit,
  ) async {
    emit(AuthUserStateLoading());
    final response = await MockAuthRepository().verifyOTP(event.request);

    await response.fold(
      (data) async => _handleVerifyOTPSuccess(data, emit),
      (error) async =>
          emit(AuthUserStateError(error, AuthUserErrorStateType.verifyOTP)),
    );
  }

  Future<void> _handleVerifyOTPSuccess(
    dynamic data,
    Emitter<AuthUserState> emit,
  ) async {
    if (data.user == null || data.tokens == null) {
      emit(
        AuthUserStateError(
          APIException.error('Unexpected response from server'),
          AuthUserErrorStateType.verifyOTP,
        ),
      );
      return;
    }

    final loginResponse = LoginResponseModel(
      user: data.user,
      tokens: data.tokens,
      redirectUrl: data.redirectUrl,
    );

    await _sessionRepository.saveSessionFromResponse(loginResponse);
    await _emitAuthenticatedState(
      emit,
      AuthenticationContext.otpVerification,
      AuthUserErrorStateType.verifyOTP,
    );
  }

  Future<void> _emitAuthenticatedState(
    Emitter<AuthUserState> emit,
    AuthenticationContext authContext,
    AuthUserErrorStateType errorType,
  ) async {
    final sessionResult = await ResultAsync.fromAsync(
      _sessionRepository.getSession,
    );

    sessionResult.fold(
      (session) {
        if (session != null) {
          emit(
            AuthUserStateAuthenticated(session: session, context: authContext),
          );
        } else {
          emit(
            AuthUserStateError(
              APIException.error('Session not found'),
              errorType,
            ),
          );
        }
      },
      (error) {
        emit(
          AuthUserStateError(APIException.error(error.toString()), errorType),
        );
      },
    );
  }

  Future<void> _loginWithPin(
    LoginWithPin event,
    Emitter<AuthUserState> emit,
  ) async {
    emit(AuthUserStateLoading());
    final response = await MockAuthRepository().loginWithPin(event.request);

    await response.fold(
      (loginResponse) async {
        if (loginResponse.tokens == null || loginResponse.user == null) {
          emit(
            AuthUserStateError(
              APIException.error('Invalid login response'),
              AuthUserErrorStateType.loginWithPin,
            ),
          );
          return;
        }

        await _sessionRepository.saveSessionFromResponse(loginResponse);
        await _emitAuthenticatedState(
          emit,
          AuthenticationContext.pinLogin,
          AuthUserErrorStateType.loginWithPin,
        );
      },
      (error) async =>
          emit(AuthUserStateError(error, AuthUserErrorStateType.loginWithPin)),
    );
  }
}
