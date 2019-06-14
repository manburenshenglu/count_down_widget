library count_down_timer;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///author xiejianlong
///description count down widget
///date 2019/6/11 14:53
///modify

enum CountDown { EN, ZH }

class CountDownWidget extends StatefulWidget {
  final int startSeconds;
  final TextStyle enableTS, disableTS;
  final String verifyStr;
  final CountDown language;

  /// click callback
  final Function onTapCallback;

  CountDownWidget(
      {this.startSeconds: 60,
      this.onTapCallback,
      this.enableTS:
          const TextStyle(fontSize: 16, color: const Color(0xff00ff00)),
      this.disableTS:
          const TextStyle(fontSize: 16, color: const Color(0xff999999)),
      this.verifyStr,
      this.language: CountDown.ZH});

  @override
  _CountDownState createState() {
    // TODO: implement createState
    return _CountDownState();
  }
}

class _CountDownState extends State<CountDownWidget> {
  Timer _timer;
  int _seconds;
  bool _enable = true;

  TextStyle _inkWellStyle;

  String _verifyStr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyStr = widget.language == CountDown.ZH ? '获取验证码' : 'Send';
    _seconds = widget.startSeconds;
    _inkWellStyle = widget.enableTS;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cancelTimer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Text(
        '$_verifyStr',
        style: _inkWellStyle,
      ),
      onTap: (_enable && (_seconds == widget.startSeconds))
          ? () {
              _startTimer();
            }
          : null,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.startSeconds;
        _verifyStr = widget.language == CountDown.ZH ? '重新发送' : 'Resend';
        _enable = true;
        _inkWellStyle = widget.enableTS;
        setState(() {});
        return;
      }

      _enable = false;
      _inkWellStyle = widget.disableTS;
      _seconds--;
      _verifyStr = '${_seconds}s';
      setState(() {});
      widget.onTapCallback(timer);
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }
}
