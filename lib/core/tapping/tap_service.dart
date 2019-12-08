import 'dart:async';

import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/services/navigation_service.dart';

import '../../locator.dart';
import 'events.dart';
import 'tapping_event_bus.dart';

class TapService {
  final TappingEventBus _bus = locator<TappingEventBus>();

  User loggedInUser;

  TapService() {
    _bus.on<UserLoggedIn>().listen(startTapping);
    _bus.on<UserLoggedOut>().listen(finishTapping);

    new Timer(const Duration(seconds: 11), () => tapAmount(0.1));
    new Timer(const Duration(seconds: 12), () => tapAmount(0.2));
    new Timer(const Duration(seconds: 13), () => tapAmount(0.3));
    new Timer(const Duration(seconds: 14), () => tapAmount(0.4));
    new Timer(const Duration(seconds: 15), () => tapAmount(0.5));
    new Timer(const Duration(seconds: 16), () => tapAmount(0.6));
  }

  void startTapping(e) {
    this.loggedInUser = e.user;
    openDraftView();
  }

  void tapAmount(double amount) async {
    if (this.loggedInUser == null) {
      return;
    }
    _bus.fire(new TapAmountUpdated(this.loggedInUser, amount));
  }

  void finishTapping(UserLoggedOut user) async {
    _bus.fire(new TapFinished(this.loggedInUser, 0.6));
    closeDraftView();
    this.loggedInUser = null;
  }

  void openDraftView() async {
    locator<NavigationService>().navigateTo(RoutePaths.Details);
  }

  void closeDraftView() async {
    locator<NavigationService>().pop();
  }
}
