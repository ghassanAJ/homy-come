import 'package:authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/domain/use_cases/get_my_team_use_case.dart';

@injectable
class MyteamCubit extends Cubit<BaseState<List<MyteamMemberModel>>> {
  MyteamCubit(this.myTeamUseCase) : super(BaseState<List<MyteamMemberModel>>());
  final GetMyTeamUseCase myTeamUseCase;
  void getMyTeamData() async {
    emit(state.copyWith(status: BaseCubitStatus.loading));
    var result = await myTeamUseCase.call();
    result.fold(
      (data) {
        emit(state.copyWith(data: data, status: BaseCubitStatus.success));
      },
      (error) {
        emit(state.copyWith(error: error, status: BaseCubitStatus.error));
      },
    );
  }
}
