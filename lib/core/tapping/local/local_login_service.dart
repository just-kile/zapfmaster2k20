import 'dart:async';
import 'dart:math';

import 'package:zapfmaster2k20/core/tapping/login_service.dart';

class LocalLoginService extends LoginService {
  LocalLoginService() {
    new Timer(const Duration(seconds: 10), () => loginDeviceRecognized("55"));
    new Timer(const Duration(seconds: 20), () => loginDeviceUnattached("55"));
//    new Timer(const Duration(seconds: 10), () => loginDeviceRecognized(new Random().nextInt(100).toString()));
  }
}
