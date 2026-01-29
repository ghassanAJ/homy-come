import 'package:go_router/go_router.dart';

class CustomRouter {
  final GoRouter _router;
  CustomRouter(this._router);

  GoRouter get router => _router;

  void go(String s, {Object? extra}) {
    _router.go(s, extra: extra);
  }

  Future<T?>? push<T>(String s, {Object? extra}) async {
    return await _router.push<T>(s, extra: extra);
  }

  void pop<T extends Object>([T? result]) {
    return _router.pop<T>(result);
  }

  void home() {
    _router.go('/');
  }

  bool canPop() {
    return _router.canPop();
  }
}
