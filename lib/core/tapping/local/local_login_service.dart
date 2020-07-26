import 'dart:async';
import 'dart:math';

import 'package:zapfmaster2k20/core/tapping/login_service.dart';

class LocalLoginService extends LoginService {
  LocalLoginService() {
    for (var i = 1; i < 5; i++) {
      new Timer(Duration(seconds: i * 5), () => loginDeviceRecognized("1"));
      new Timer(Duration(seconds: i * 5 + 3), () => loginDeviceUnattached("1"));
    }

//
//    new Timer(const Duration(seconds: 10), () => loginDeviceRecognized(new Random().nextInt(100).toString()));
  }
}
