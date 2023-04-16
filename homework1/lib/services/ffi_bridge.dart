import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

class FFIBridge {

  late int Function(Pointer<Utf8>) _getLength;

  FFIBridge() {
    final dl = Platform.isAndroid ? DynamicLibrary.open('librandom.so') : DynamicLibrary.process();
    _getLength = dl.lookupFunction<Int16 Function(Pointer<Utf8>),
        int Function(Pointer<Utf8>)>("get_length");
  }

  int getCLength(String str)=>_getLength(str.toNativeUtf8());

}