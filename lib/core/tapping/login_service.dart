import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/core/user/user_repository.dart';

import '../../locator.dart';
import 'events.dart';

class LoginService {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final UserRepository _userRepository = locator<UserRepository>();

  LoginService() {
    print("Login service initialized");
    new Timer(const Duration(seconds: 5), userLoggedIn);
    new Timer(const Duration(seconds: 7), userLoggedOut);
  }

  void userLoggedIn() async {
    print("Log in user");
    final user = await _userRepository.getUserByHardwareToken("1");
    if(user == null){
      print("User is null!");
      return;
    }
    _bus.fire(new UserLoggedIn(user));
  }

  void userLoggedOut() async {
    print("Log out user");
    final user = await _userRepository.getUserByHardwareToken("1");
    if(user == null){
      print("User is null!");
      return;
    }

    _bus.fire(new UserLoggedOut(user));
  }
}
