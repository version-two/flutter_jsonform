import 'dart:async';

import 'package:flutter/services.dart';

class FlutterJsonform {
  static const MethodChannel _channel =
      const MethodChannel('flutter_jsonform');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
