import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/login_service.dart';

class LocalLoginService extends LoginService {
  LocalLoginService() {
    new Timer(const Duration(seconds: 10), () => userLoggedIn("3"));
    new Timer(const Duration(seconds: 20), () => userLoggedOut("3"));
  }
}
