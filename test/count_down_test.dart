import 'package:count_down_timer/count_down_timer.dart';
import 'package:flutter/material.dart';

void main() {
  CountDownWidget(
    startSeconds: 60,
    onTapCallback: (timer) {
      print('onTapCallback：current is ${timer.tick}s');
    },
    enableTS:
    TextStyle(color: const Color(0xff00ff00)),
    disableTS:
    TextStyle(color: const Color(0xff999999)),
  );
}
