import 'package:flutter/services.dart';

class PlatformService {

  static const method =MethodChannel('CALL_METHOD');


  Future<String> callMethodChanel() async {
    try{
      return await method.invokeMethod('CALL',{"text":'текст'});
    }on PlatformException catch(e){
      print('Failed to get value ${e.message}');
      return '';
    }
  }



}