// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthUserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthUserState()';
}


}

/// @nodoc
class $AuthUserStateCopyWith<$Res>  {
$AuthUserStateCopyWith(AuthUserState _, $Res Function(AuthUserState) __);
}


/// Adds pattern-matching-related methods to [AuthUserState].
extension AuthUserStatePatterns on AuthUserState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthUserStateInitial value)?  initial,TResult Function( AuthUserStateAuthenticated value)?  authenticated,TResult Function( AuthUserStateLoading value)?  loading,TResult Function( AuthUserStateError value)?  error,TResult Function( AuthUserStateLoggedOut value)?  loggedOut,TResult Function( AuthUserStateSessionExpired value)?  sessionExpired,TResult Function( AuthUserStateOTPSent value)?  otpSent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthUserStateInitial() when initial != null:
return initial(_that);case AuthUserStateAuthenticated() when authenticated != null:
return authenticated(_that);case AuthUserStateLoading() when loading != null:
return loading(_that);case AuthUserStateError() when error != null:
return error(_that);case AuthUserStateLoggedOut() when loggedOut != null:
return loggedOut(_that);case AuthUserStateSessionExpired() when sessionExpired != null:
return sessionExpired(_that);case AuthUserStateOTPSent() when otpSent != null:
return otpSent(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthUserStateInitial value)  initial,required TResult Function( AuthUserStateAuthenticated value)  authenticated,required TResult Function( AuthUserStateLoading value)  loading,required TResult Function( AuthUserStateError value)  error,required TResult Function( AuthUserStateLoggedOut value)  loggedOut,required TResult Function( AuthUserStateSessionExpired value)  sessionExpired,required TResult Function( AuthUserStateOTPSent value)  otpSent,}){
final _that = this;
switch (_that) {
case AuthUserStateInitial():
return initial(_that);case AuthUserStateAuthenticated():
return authenticated(_that);case AuthUserStateLoading():
return loading(_that);case AuthUserStateError():
return error(_that);case AuthUserStateLoggedOut():
return loggedOut(_that);case AuthUserStateSessionExpired():
return sessionExpired(_that);case AuthUserStateOTPSent():
return otpSent(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthUserStateInitial value)?  initial,TResult? Function( AuthUserStateAuthenticated value)?  authenticated,TResult? Function( AuthUserStateLoading value)?  loading,TResult? Function( AuthUserStateError value)?  error,TResult? Function( AuthUserStateLoggedOut value)?  loggedOut,TResult? Function( AuthUserStateSessionExpired value)?  sessionExpired,TResult? Function( AuthUserStateOTPSent value)?  otpSent,}){
final _that = this;
switch (_that) {
case AuthUserStateInitial() when initial != null:
return initial(_that);case AuthUserStateAuthenticated() when authenticated != null:
return authenticated(_that);case AuthUserStateLoading() when loading != null:
return loading(_that);case AuthUserStateError() when error != null:
return error(_that);case AuthUserStateLoggedOut() when loggedOut != null:
return loggedOut(_that);case AuthUserStateSessionExpired() when sessionExpired != null:
return sessionExpired(_that);case AuthUserStateOTPSent() when otpSent != null:
return otpSent(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( SessionModel session,  VerifiedUserModel user,  AuthenticationContext context)?  authenticated,TResult Function()?  loading,TResult Function( APIException error,  AuthUserErrorStateType stateType)?  error,TResult Function()?  loggedOut,TResult Function()?  sessionExpired,TResult Function( String sessionId,  String identifier,  String? userType)?  otpSent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthUserStateInitial() when initial != null:
return initial();case AuthUserStateAuthenticated() when authenticated != null:
return authenticated(_that.session,_that.user,_that.context);case AuthUserStateLoading() when loading != null:
return loading();case AuthUserStateError() when error != null:
return error(_that.error,_that.stateType);case AuthUserStateLoggedOut() when loggedOut != null:
return loggedOut();case AuthUserStateSessionExpired() when sessionExpired != null:
return sessionExpired();case AuthUserStateOTPSent() when otpSent != null:
return otpSent(_that.sessionId,_that.identifier,_that.userType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( SessionModel session,  VerifiedUserModel user,  AuthenticationContext context)  authenticated,required TResult Function()  loading,required TResult Function( APIException error,  AuthUserErrorStateType stateType)  error,required TResult Function()  loggedOut,required TResult Function()  sessionExpired,required TResult Function( String sessionId,  String identifier,  String? userType)  otpSent,}) {final _that = this;
switch (_that) {
case AuthUserStateInitial():
return initial();case AuthUserStateAuthenticated():
return authenticated(_that.session,_that.user,_that.context);case AuthUserStateLoading():
return loading();case AuthUserStateError():
return error(_that.error,_that.stateType);case AuthUserStateLoggedOut():
return loggedOut();case AuthUserStateSessionExpired():
return sessionExpired();case AuthUserStateOTPSent():
return otpSent(_that.sessionId,_that.identifier,_that.userType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( SessionModel session,  VerifiedUserModel user,  AuthenticationContext context)?  authenticated,TResult? Function()?  loading,TResult? Function( APIException error,  AuthUserErrorStateType stateType)?  error,TResult? Function()?  loggedOut,TResult? Function()?  sessionExpired,TResult? Function( String sessionId,  String identifier,  String? userType)?  otpSent,}) {final _that = this;
switch (_that) {
case AuthUserStateInitial() when initial != null:
return initial();case AuthUserStateAuthenticated() when authenticated != null:
return authenticated(_that.session,_that.user,_that.context);case AuthUserStateLoading() when loading != null:
return loading();case AuthUserStateError() when error != null:
return error(_that.error,_that.stateType);case AuthUserStateLoggedOut() when loggedOut != null:
return loggedOut();case AuthUserStateSessionExpired() when sessionExpired != null:
return sessionExpired();case AuthUserStateOTPSent() when otpSent != null:
return otpSent(_that.sessionId,_that.identifier,_that.userType);case _:
  return null;

}
}

}

/// @nodoc


class AuthUserStateInitial implements AuthUserState {
  const AuthUserStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthUserState.initial()';
}


}




/// @nodoc


class AuthUserStateAuthenticated implements AuthUserState {
  const AuthUserStateAuthenticated({required this.session, required this.user, this.context = AuthenticationContext.unknown});
  

 final  SessionModel session;
 final  VerifiedUserModel user;
@JsonKey() final  AuthenticationContext context;

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserStateAuthenticatedCopyWith<AuthUserStateAuthenticated> get copyWith => _$AuthUserStateAuthenticatedCopyWithImpl<AuthUserStateAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateAuthenticated&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user)&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,session,user,context);

@override
String toString() {
  return 'AuthUserState.authenticated(session: $session, user: $user, context: $context)';
}


}

/// @nodoc
abstract mixin class $AuthUserStateAuthenticatedCopyWith<$Res> implements $AuthUserStateCopyWith<$Res> {
  factory $AuthUserStateAuthenticatedCopyWith(AuthUserStateAuthenticated value, $Res Function(AuthUserStateAuthenticated) _then) = _$AuthUserStateAuthenticatedCopyWithImpl;
@useResult
$Res call({
 SessionModel session, VerifiedUserModel user, AuthenticationContext context
});


$VerifiedUserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthUserStateAuthenticatedCopyWithImpl<$Res>
    implements $AuthUserStateAuthenticatedCopyWith<$Res> {
  _$AuthUserStateAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthUserStateAuthenticated _self;
  final $Res Function(AuthUserStateAuthenticated) _then;

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? user = null,Object? context = null,}) {
  return _then(AuthUserStateAuthenticated(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as VerifiedUserModel,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as AuthenticationContext,
  ));
}

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VerifiedUserModelCopyWith<$Res> get user {
  
  return $VerifiedUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthUserStateLoading implements AuthUserState {
  const AuthUserStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthUserState.loading()';
}


}




/// @nodoc


class AuthUserStateError implements AuthUserState {
  const AuthUserStateError(this.error, this.stateType);
  

 final  APIException error;
 final  AuthUserErrorStateType stateType;

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserStateErrorCopyWith<AuthUserStateError> get copyWith => _$AuthUserStateErrorCopyWithImpl<AuthUserStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateError&&(identical(other.error, error) || other.error == error)&&(identical(other.stateType, stateType) || other.stateType == stateType));
}


@override
int get hashCode => Object.hash(runtimeType,error,stateType);

@override
String toString() {
  return 'AuthUserState.error(error: $error, stateType: $stateType)';
}


}

/// @nodoc
abstract mixin class $AuthUserStateErrorCopyWith<$Res> implements $AuthUserStateCopyWith<$Res> {
  factory $AuthUserStateErrorCopyWith(AuthUserStateError value, $Res Function(AuthUserStateError) _then) = _$AuthUserStateErrorCopyWithImpl;
@useResult
$Res call({
 APIException error, AuthUserErrorStateType stateType
});




}
/// @nodoc
class _$AuthUserStateErrorCopyWithImpl<$Res>
    implements $AuthUserStateErrorCopyWith<$Res> {
  _$AuthUserStateErrorCopyWithImpl(this._self, this._then);

  final AuthUserStateError _self;
  final $Res Function(AuthUserStateError) _then;

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? stateType = null,}) {
  return _then(AuthUserStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as APIException,null == stateType ? _self.stateType : stateType // ignore: cast_nullable_to_non_nullable
as AuthUserErrorStateType,
  ));
}


}

/// @nodoc


class AuthUserStateLoggedOut implements AuthUserState {
  const AuthUserStateLoggedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateLoggedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthUserState.loggedOut()';
}


}




/// @nodoc


class AuthUserStateSessionExpired implements AuthUserState {
  const AuthUserStateSessionExpired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateSessionExpired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthUserState.sessionExpired()';
}


}




/// @nodoc


class AuthUserStateOTPSent implements AuthUserState {
   AuthUserStateOTPSent({required this.sessionId, required this.identifier, this.userType});
  

 final  String sessionId;
 final  String identifier;
// email or phone for display
 final  String? userType;

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserStateOTPSentCopyWith<AuthUserStateOTPSent> get copyWith => _$AuthUserStateOTPSentCopyWithImpl<AuthUserStateOTPSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserStateOTPSent&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.identifier, identifier) || other.identifier == identifier)&&(identical(other.userType, userType) || other.userType == userType));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,identifier,userType);

@override
String toString() {
  return 'AuthUserState.otpSent(sessionId: $sessionId, identifier: $identifier, userType: $userType)';
}


}

/// @nodoc
abstract mixin class $AuthUserStateOTPSentCopyWith<$Res> implements $AuthUserStateCopyWith<$Res> {
  factory $AuthUserStateOTPSentCopyWith(AuthUserStateOTPSent value, $Res Function(AuthUserStateOTPSent) _then) = _$AuthUserStateOTPSentCopyWithImpl;
@useResult
$Res call({
 String sessionId, String identifier, String? userType
});




}
/// @nodoc
class _$AuthUserStateOTPSentCopyWithImpl<$Res>
    implements $AuthUserStateOTPSentCopyWith<$Res> {
  _$AuthUserStateOTPSentCopyWithImpl(this._self, this._then);

  final AuthUserStateOTPSent _self;
  final $Res Function(AuthUserStateOTPSent) _then;

/// Create a copy of AuthUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? identifier = null,Object? userType = freezed,}) {
  return _then(AuthUserStateOTPSent(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,identifier: null == identifier ? _self.identifier : identifier // ignore: cast_nullable_to_non_nullable
as String,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
