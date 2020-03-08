import 'dart:async';

import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/navigation/navigation_service.dart';

import '../../locator.dart';
import '../../logger.dart';
import 'events.dart';
import 'tapping_event_bus.dart';

class TapService {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();

  UserDto loggedInUser;
  double amount = 0;
  TapService() {
    _bus.on<UserLoggedIn>().listen(startTapping);
    _bus.on<UserLoggedOut>().listen(finishTapping);
  }

  void startTapping(UserLoggedIn e) {
    this.loggedInUser = e.user;
    amount = 0;
    _openDraftView();

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
    this.amount = amount;
    logger.i("User ${this.loggedInUser.name} tapped amount $amount");
    _bus.fire(new TapAmountUpdated(this.loggedInUser, amount));
  }

  void finishTapping(UserLoggedOut event) async {
    var drawingDto = await _persistDrawing();
    _emitFinishedEvent(drawingDto);
    _closeDraftView();
    _resetUser();
  }

  void _emitFinishedEvent(DrawingDto drawingDto) {
    logger.i("User ${this.loggedInUser.name} finished tapping");
    _bus.fire(new TapFinished(this.loggedInUser, drawingDto, DateTime.now()));
  }

  void _resetUser() {
    this.loggedInUser = null;
  }

  void _openDraftView() async {
    locator<NavigationService>().navigateTo(RoutePaths.Tapping);
  }

  void _closeDraftView() async {
    locator<NavigationService>().pop();
  }

  Future<DrawingDto> _persistDrawing() {
    return _db.drawingDao.saveDrawing(
        DrawingDto(null, this.loggedInUser.id, this.amount, DateTime.now()));
  }
}
