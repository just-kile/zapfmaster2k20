import 'dart:async';

import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/core/user/user_repository.dart';

import '../../locator.dart';
import '../../logger.dart';
import 'events.dart';

class LoginService {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final UserRepository _userRepository = locator<UserRepository>();
  LoginService() {
    new Timer(const Duration(seconds: 1), userLoggedIn);
    new Timer(const Duration(seconds: 3), userLoggedOut);
    new Timer(const Duration(seconds: 4), userLoggedIn);
    new Timer(const Duration(seconds: 6), userLoggedOut);
    new Timer(const Duration(seconds: 8), userLoggedIn);
    new Timer(const Duration(seconds: 10), userLoggedOut);
  }

  void userLoggedIn() async {
    var hardwareToken = "3";

    final user = await _userRepository.getUserByHardwareToken(hardwareToken);
    if (user == null) {
      logger.i("Cannot find user with hardware token $hardwareToken");
      return;
    }
    logger.i("${user.name} logged in");
    _bus.fire(new UserLoggedIn(user));
  }

  void userLoggedOut() async {
    var hardwareToken = "3";
    final user = await _userRepository.getUserByHardwareToken(hardwareToken);
    if (user == null) {
      logger.w("Cannot find user with hardware token $hardwareToken");
      return;
    }
    logger.i("${user.name} logged out");
    _bus.fire(new UserLoggedOut(user));
  }
}
