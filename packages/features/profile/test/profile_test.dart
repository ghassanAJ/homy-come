// import 'package:profile/profile.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:profile/src/data/model/res/myTeam_member_model.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/use_cases/get_my_team_use_case.dart';
import 'package:profile/src/presentation/cubit/myTeam_cubit.dart';
import 'package:util/util.dart';
import '../lib/src/domain/repository/mock_profile_repository.dart' as mock;
import 'package:bloc_test/bloc_test.dart';
import '../lib/profile.dart';
import 'profile_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  setUpAll(() {
    provideDummy<Result<List<MyteamMemberModel>, APIException>>(
      success(<MyteamMemberModel>[]),
    );
  });

  late MockProfileRepository mockProfileRepo;
  late GetMyTeamUseCase useCase;
  late MyteamCubit myTeamsCubit;

  setUp(() {
    mockProfileRepo = MockProfileRepository();
    useCase = GetMyTeamUseCase(mockProfileRepo);
    myTeamsCubit = MyteamCubit(useCase);
  });

  group('test my teams ', () {
    test('should return team members when repository call succeeds', () async {
      final teamMembers = [
        MyteamMemberModel(
          id: 1,
          nameMember: 'ghassan',
          phone: '963123456789',
          status: 'working',
        ),
      ];
      when(
        mockProfileRepo.fetchMyTeam(),
      ).thenAnswer((_) async => success(teamMembers));
      final result = await useCase();
      result.fold(
        (data) {
          expect(data, teamMembers);
        },
        (error) {
          fail('should not return error');
        },
      );
    });

    test('should return team members when repository call failure', () async {
      final APIException errorEx = APIException.error('error');
      when(
        mockProfileRepo.fetchMyTeam(),
      ).thenAnswer((_) async => failure(errorEx));
      final result = await useCase();
      result.fold(
        (data) {
          fail('should not return error');
        },
        (error) {
          expect(error, errorEx);
        },
      );
    });

    blocTest<MyteamCubit, BaseState<List<MyteamMemberModel>>>(
      'emits success when data is fetched successfully',
      build: () {
        final teamMembers = [
          MyteamMemberModel(
            id: 1,
            nameMember: 'ghassan',
            phone: '963123456789',
            status: 'working',
          ),
        ];
        when(
          mockProfileRepo.fetchMyTeam(),
        ).thenAnswer((_) async => success(teamMembers));
        return myTeamsCubit;
      },
      act: (cubit) => cubit.getMyTeamData(),
      verify: (_) {
        verify(mockProfileRepo.fetchMyTeam()).called(1);
      },
    );

    blocTest<MyteamCubit, BaseState<List<MyteamMemberModel>>>(
      'emits success when data is fetched failure',
      build: () {
        final error = APIException.error('error');
        when(
          mockProfileRepo.fetchMyTeam(),
        ).thenAnswer((_) async => failure(error));
        return myTeamsCubit;
      },
      act: (cubit) => cubit.getMyTeamData(),
      verify: (_) {
        verify(mockProfileRepo.fetchMyTeam()).called(1);
      },
    );
  });
}
