import 'dart:isolate';

import 'package:flutter/material.dart';

import 'package:android_alarm_manager/android_alarm_manager.dart';

Future<void> main() async {
  final int helloAlarmID = 0;
  final int goodbyeAlarmID = 1;
  final int oneShotID = 2;

  // Start the AlarmManager service.
  await AndroidAlarmManager.initialize();

  print(hashCode());
  runApp(const Center(child: Text('Hello, world!', textDirection: TextDirection.ltr)));
  bool v = await AndroidAlarmManager.oneShot(const Duration(seconds: 1), helloAlarmID, TTT.aaa, exact: true, wakeup: true);
  print("1010101010 - hello return $v");
}

int hashCode() {
  return Isolate.current.hashCode;
}

DateTime nowString() {
  return DateTime.now();
}

class TTT {
  static void aaa() {
    print("222222222222222 - aaa ${nowString()} - isolate ${hashCode()}");
    AndroidAlarmManager.oneShot(const Duration(seconds: 1), 0, TTT.aaaasync);
  }

  static void aaaasync() async {
    print("222222222222222 - aaaasync ${nowString()} - isolate ${hashCode()}");
  }
}
