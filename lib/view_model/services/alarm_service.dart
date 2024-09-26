import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'dart:isolate';

import 'notfication_service.dart';

class AlarmService {
  static const String isolateName = 'alarmIsolate';
  static SendPort? uiSendPort;

  static Future<void> setExactAlarm(int id, DateTime alarmTime) async {
    await AndroidAlarmManager.oneShotAt(
      alarmTime,
      id,  // Unique ID for the alarm
      alarmCallback,
      exact: true,
      wakeup: true,
    );
  }

  // Alarm callback function
  static Future<void> alarmCallback() async {
    print('Alarm triggered!');  // This will trigger when alarm goes off
    NotificationService.showNotification();
    // You can add notification here using flutter_local_notifications
  }

  static void startListening() {
    // Listen for events after the alarm
    final port = ReceivePort();
    IsolateNameServer.registerPortWithName(port.sendPort, isolateName);
    port.listen((dynamic data) {
      // Handle alarm event here
    });
  }

  static void stopListening() {
    IsolateNameServer.removePortNameMapping(isolateName);
  }
}
