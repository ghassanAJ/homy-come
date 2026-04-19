import 'package:injectable/injectable.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:util/util.dart';

@injectable
class GetMyTeamUseCase extends BaseUseCase<List<MyteamMemberModel>> {
  final ProfileRepository _repo;

   GetMyTeamUseCase(this._repo,);
  @override
  Future<Result<List<MyteamMemberModel>, APIException>> call() {
    return _repo.fetchMyTeam();
  }
}
