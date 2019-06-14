import 'package:count_down_timer/count_down_timer.dart';
import 'package:flutter/material.dart';

void main() {
  CountDownWidget(
    startSeconds: 6,
    onTapCallback: (timer) {
      print('onTapCallback：current is ${timer.tick}s');
    },
    language: CountDown.EN,
    verifyStr: "Send",
    enableTS: TextStyle(color: const Color(0xff000000)),
    disableTS: TextStyle(color: const Color(0xff999999)),
  );
}
