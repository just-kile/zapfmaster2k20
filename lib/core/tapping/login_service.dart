import 'dart:async';

import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';
import 'events.dart';

class LoginService {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final Db _db = locator<Db>();

  LoginService() {
    print("Login service initialized");
    new Timer(const Duration(seconds: 5), userLoggedIn);
    new Timer(const Duration(seconds: 20), userLoggedOut);
  }

  void userLoggedIn() async {
    print("Log in user");
    final user = await _db.getUserWithToken("token defined by NFC");
    _bus.fire(new UserLoggedIn(user));
  }

  void userLoggedOut() async {
    print("Log out user");
    final user = await _db.getUserWithToken("token defined by NFC");
    _bus.fire(new UserLoggedOut(user));
  }
}
