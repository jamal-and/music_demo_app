import 'dart:async';

import 'package:get/get.dart';

class PlayerViewmodel extends GetxController {
  final fullDuration = const Duration(minutes: 1, seconds: 48);
  Duration currentDuration = const Duration(minutes: 0, seconds: 0);
  bool isPlaying = false;

  double getCurrentProgress() {
    return currentDuration.inMilliseconds / fullDuration.inMilliseconds;
  }

  Timer? timer;

  onPlay() {
    isPlaying = true;
    if (currentDuration.inSeconds >= fullDuration.inSeconds) {
      currentDuration = Duration.zero;
    }
    update();
    int timeUnit = 100;
    Duration time = Duration(milliseconds: timeUnit);
    timer = Timer.periodic(
      time,
      (v) {
        currentDuration =
            Duration(milliseconds: currentDuration.inMilliseconds + timeUnit);
        if (currentDuration.inSeconds >= fullDuration.inSeconds) {
          onPause();
        }

        update();
      },
    );
  }

  onPause() {
    isPlaying = false;
    update();
    timer?.cancel();
  }

  onSliderChanged(double value) {
    currentDuration =
        Duration(seconds: (fullDuration.inSeconds * value).toInt());
    update();
  }

  @override
  void onReady() {
    super.onReady();
    onPlay();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
