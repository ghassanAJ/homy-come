import 'dart:async';
import 'package:flutter/foundation.dart';

class ResendTimerController extends ChangeNotifier {
  Timer? _timer;
  int _remainingSeconds;
  final int durationSeconds;

  ResendTimerController({required this.durationSeconds})
    : _remainingSeconds = durationSeconds;
  int get remainingSeconds => _remainingSeconds;
  bool get canResend => _remainingSeconds == 0;

  bool get isRunning => _timer != null && _timer!.isActive;

  String get formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final secs = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  void start() {
    _cancelTimer();
    _remainingSeconds = durationSeconds;
    notifyListeners();
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    if (_remainingSeconds > 0) {
      _remainingSeconds--;
      notifyListeners();
    } else {
      _cancelTimer();
      notifyListeners();
    }
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    _cancelTimer();
    _remainingSeconds = durationSeconds;
    notifyListeners();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }
}
