import 'dart:async';

import 'package:zapfmaster2k20/core/draft_measuring/events.dart';
import 'package:zapfmaster2k20/core/draft_measuring/user_event_bus.dart';
import 'package:zapfmaster2k20/core/services/db.dart';

import '../../locator.dart';

class LoginService {
  final UserEventBus _bus = locator<UserEventBus>();
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
