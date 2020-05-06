library count_down_timer;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  final String phone;
  final double widgetWidth;
  final Decoration decoration;
  final EdgeInsetsGeometry padding;

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
      this.language: CountDown.ZH,
      this.phone: '',
      this.widgetWidth: 100.0,
      this.decoration,
      this.padding});

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
      child: Container(
        decoration: widget?.decoration,
        padding: widget?.padding,
        alignment: Alignment.center,
        width: widget?.widgetWidth,
        child: Text(
          '$_verifyStr',
          style: _inkWellStyle,
        ),
      ),
      onTap: (_enable && (_seconds == widget.startSeconds))
          ? () {
              if (widget?.phone?.isEmpty ?? true) {
                print('CountDownWidget--------->  phone is empty!');
                Fluttertoast.showToast(
                    msg: widget?.language == CountDown.ZH
                        ? '请先输入手机号！'
                        : 'Please input phone number！',
                    toastLength: Toast.LENGTH_LONG);
              } else {
                if (widget?.language == CountDown.ZH) {
                  if (!isChinaPhoneLegal(widget?.phone)) {
                    Fluttertoast.showToast(
                        msg: '请输入正确的手机号！', toastLength: Toast.LENGTH_LONG);
                    return;
                  }
                }
                _startTimer();
              }
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

  bool isChinaPhoneLegal(String str) {
    return RegExp(
            r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
        .hasMatch(str);
  }

  void _cancelTimer() {
    _timer?.cancel();
  }
}
