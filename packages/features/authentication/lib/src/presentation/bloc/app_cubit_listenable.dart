import 'dart:async';

import 'package:authentication/src/presentation/cubit/cubit.dart';
import 'package:flutter/foundation.dart';

class AppCubitListenable extends ChangeNotifier {
  final AppCubit _appCubit;
  StreamSubscription<AppState>? _subscription;

  AppCubitListenable(this._appCubit) {
    _subscription = _appCubit.stream.listen((_) {
      notifyListeners();
    });
  }

  AppState get state => _appCubit.state;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
