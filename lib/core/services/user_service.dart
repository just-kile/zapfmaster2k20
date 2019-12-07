import 'dart:async';

import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/draft_measuring/model.dart';
import 'package:zapfmaster2k20/core/draft_measuring/user_event_bus.dart';

import '../../locator.dart';
import 'db.dart';
import 'navigation_service.dart';

class UserService {
  final Db _db = locator<Db>();
  final UserEventBus _bus = locator<UserEventBus>();

  UserService() {
//    new Timer(const Duration(seconds: 10), openDraftView);
//    new Timer(const Duration(seconds: 20), closeDraftView);
//    new Timer.periodic(const Duration(seconds: 4), timerCb);
    _bus.on<UserLoggedIn>().listen((e)=>openDraftView());
    _bus.on<UserLoggedOut>().listen((e)=>closeDraftView());
  }

  StreamController<List<User>> _userController = StreamController<List<User>>();

  Stream<List<User>> get users => _userController.stream;

  void timerCb(Timer timer) async {
    print('Timer called');
    _userController.add(await _db.getBestList());
  }

  void openDraftView() async {
    locator<NavigationService>().navigateTo(RoutePaths.Details);
  }
  void closeDraftView() async {
    locator<NavigationService>().pop();
  }
}
