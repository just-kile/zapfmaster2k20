import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/login_service.dart';

class LocalLoginService extends LoginService {
  LocalLoginService() {
    new Timer(const Duration(seconds: 5), () => userLoggedIn("3"));
    new Timer(const Duration(seconds: 15), () => userLoggedOut("3"));
  }
}
