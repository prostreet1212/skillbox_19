import 'package:flutter/services.dart';

class PlatformService {
  static const method = MethodChannel('CALL_METHOD');

  Future<void> callSetText(String s) async {
    try {
      await method.invokeMethod('setText', s);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to get value ${e.message}');
    }
  }
}
