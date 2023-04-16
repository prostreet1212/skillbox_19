



import 'package:project1/web/web_interop.dart';

import '../service.dart';

abstract class PlatformService {
  int getValue();

  Stream<int> getStream();
}

PlatformService getService() {
  return PlatformServiceImpl();
}

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  int getValue() {

    return _manager.getValueFromJs();
  }

  @override
  Stream<int> getStream() => _manager.buttonClicked;


}