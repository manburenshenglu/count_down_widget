library count_down;

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

///author xiejianlong
///description 倒计时组件
///date 2019/6/11 14:53
///modify
class CountDownWidget extends StatefulWidget {
  final int startSeconds;
  final TextStyle enableTS, disableTS;

  /// 用户点击时的回调函数。
  final Function onTapCallback;

  CountDownWidget(
      {this.startSeconds: 60,
        this.onTapCallback,
        this.enableTS,
        this.disableTS});

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

  /// 当前墨水瓶（`InkWell`）的字体样式。
  TextStyle inkWellStyle = _defaultEnableTS;

  /// 当前墨水瓶（`InkWell`）的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seconds = widget.startSeconds;
    print('sec=${_seconds}');
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
    return _enable
        ? InkWell(
      child: Text(
        '${_verifyStr}',
        style: inkWellStyle,
      ),
      onTap: (_seconds == widget.startSeconds)
          ? () {
        _startTimer();
      }
          : null,
    )
        : InkWell(
      child: Text(
        '${_verifyStr}',
        style: _defaultDisableTS,
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        _seconds = widget.startSeconds;
        _verifyStr = '重新发送';
        _enable = true;
        inkWellStyle = _defaultEnableTS;
        setState(() {});
        return;
      }

      _enable = false;
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

final TextStyle _defaultEnableTS =
TextStyle(fontSize: 16, color: const Color(0xff00ff00));
final TextStyle _defaultDisableTS =
TextStyle(fontSize: 16, color: const Color(0xff999999));

