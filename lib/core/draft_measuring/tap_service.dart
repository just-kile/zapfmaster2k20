import 'dart:async';

import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/draft_measuring/model.dart';
import 'package:zapfmaster2k20/core/draft_measuring/user_event_bus.dart';

import '../../locator.dart';

class TapService {
  final UserEventBus _bus = locator<UserEventBus>();

  User loggedInUser;

  TapService() {
    _bus.on<UserLoggedIn>().listen((e) => this.loggedInUser = e.user);
    _bus.on<UserLoggedOut>().listen((e) => this.loggedInUser = null);

    new Timer(const Duration(seconds: 11), () => tapAmount(0.1));
    new Timer(const Duration(seconds: 12), () => tapAmount(0.2));
    new Timer(const Duration(seconds: 13), () => tapAmount(0.3));
    new Timer(const Duration(seconds: 14), () => tapAmount(0.4));
    new Timer(const Duration(seconds: 15), () => tapAmount(0.5));
    new Timer(const Duration(seconds: 16), () => tapAmount(0.6));
  }

  void tapAmount(double amount) async {
    if (this.loggedInUser == null) {
      return;
    }
    _bus.fire(new DraftUpdated(this.loggedInUser, amount));
  }
}
