import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/core/user/user_repository.dart';

import '../../locator.dart';
import '../../logger.dart';
import 'events.dart';

abstract class LoginService {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final UserRepository _userRepository = locator<UserRepository>();

  void loginDeviceRecognized(String hardwareToken) async {
    final user = await _userRepository.getUserByHardwareToken(hardwareToken);
    if (user == null) {
      logger.i("Cannot find user with hardware token $hardwareToken");
      _bus.fire(new UnknownLoginDeviceRecognized(hardwareToken));
      return;
    }
    logger.i("${user.name} logged in");
    _bus.fire(new UserLoggedIn(user));
  }

  void loginDeviceUnattached(String hardwareToken) async {
    final user = await _userRepository.getUserByHardwareToken(hardwareToken);
    if (user == null) {
      logger.i("Cannot find user with hardware token $hardwareToken");
      return;
    }
    logger.i("${user.name} logged out");
    _bus.fire(new UserLoggedOut(user));
  }
}
