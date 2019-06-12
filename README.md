# count_down

A new Flutter  countdown project that can be used to send SMS verification code scenarios

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.
README.md CHANGELOG.md Example Installing Versions
96
fluttertoast #
Android and iOS Toast Library for Flutter

Supported Platforms

Android
IOS

How to Use #
# add this line to your dependencies
count_down: ^0.0.1
import 'package:count_down/count_down.dart';

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




