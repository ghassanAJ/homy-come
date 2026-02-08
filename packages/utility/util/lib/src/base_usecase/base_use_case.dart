// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:util/util.dart';

/// -------------------------------------------------------------------------
/// BaseUseCase<T>
///
/// An abstract class representing a generic "use case" in your application.
/// Each use case encapsulates a single business logic action, e.g.,
/// "login", "fetch user profile", or "reset password".
///
/// Type Parameter:
///   - `T`: The type of data that this use case returns upon success.
///
/// Usage:
///   1. Create a concrete subclass implementing `call()` with your business logic.
///   2. Return a `Result<T, MDException>` to indicate success or failure.
/// -------------------------------------------------------------------------
abstract class BaseUseCase<T> {
  /// Executes the use case logic.
  ///
  /// Returns a [Result] containing either:
  ///   - `T` on success, or
  ///   - `MDException` on failure.

  Future<Result<T, APIException>> call();
}

/// Example:
/// ```dart
/// class FetchUserProfileUseCase extends BaseUseCase<User> {
///   final UserRepository repository;
///   FetchUserProfileUseCase(this.repository);
///
///   @override
///   Future<Result<User, MDException>> call() async {
///     try {
///       final user = await repository.getUser();
///       return Result.success(user);
///     } catch (e) {
///       return Result.failure(MDException(ExceptionType.error, e.toString()));
///     }
///   }
/// }
/// ```
///
///
///
///
@Deprecated('Use BasePaginationFetchUseCase instead')
abstract class BaseFetchPaginationUseCase<T> {
  /// Executes the use case logic.
  ///
  /// Returns a [Result] containing either:
  ///   - `PageModel<T>` on success, or
  ///   - `MDException` on failure.

  Future<Result<PageModel<T>, APIException>> call(int page, int itemsPerPage);
}

abstract class IPaginationFetchUseCase<T, P extends PaginationParams> {
  Future<Result<PageModel<T>, APIException>> call(P params);
}

abstract class BasePaginationFetchUseCase<T, P extends PaginationParams>
    implements IPaginationFetchUseCase<T, P> {
  @override
  Future<Result<PageModel<T>, APIException>> call(P params);
}

abstract class SimplePaginationFetchUseCase<T>
    extends BasePaginationFetchUseCase<T, PaginationParams> {}

class PaginationParams {
  final int page;
  final int itemsPerPage;

  PaginationParams({this.page = 1, this.itemsPerPage = 20});

  Map<String, dynamic> toQueryParams() {
    return {'page': page, 'limit': itemsPerPage};
  }

  PaginationParams copyWith({int? page, int? itemsPerPage}) {
    return PaginationParams(
      page: page ?? this.page,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }
}
