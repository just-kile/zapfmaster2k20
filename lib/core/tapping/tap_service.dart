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
  }

  void startTapping(e) {
    this.loggedInUser = e.user;
    openDraftView();

    new Timer(const Duration(seconds: 1), () => tapAmount(0.1));
    new Timer(const Duration(seconds: 2), () => tapAmount(0.2));
    new Timer(const Duration(seconds: 3), () => tapAmount(0.3));
    new Timer(const Duration(seconds: 4), () => tapAmount(0.4));
    new Timer(const Duration(seconds: 5), () => tapAmount(0.5));
    new Timer(const Duration(seconds: 6), () => tapAmount(0.6));
  }

  void tapAmount(double amount) async {
    if (this.loggedInUser == null) {
      return;
    }
    _bus.fire(new TapAmountUpdated(this.loggedInUser, amount));
  }

  void finishTapping(UserLoggedOut event) async {
    emitFinishedEvent();
    closeDraftView();
    resetUser();
  }

  void emitFinishedEvent() {
    _bus.fire(new TapFinished(this.loggedInUser, 0.6));
  }

  void resetUser() {
    this.loggedInUser = null;
  }

  void openDraftView() async {
    locator<NavigationService>().navigateTo(RoutePaths.Tapping);
  }

  void closeDraftView() async {
    locator<NavigationService>().pop();
  }
}
