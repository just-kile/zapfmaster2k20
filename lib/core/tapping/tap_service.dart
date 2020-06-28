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

abstract class TapService {
  final TOLERANCE = 0.05;
  final TappingEventBus _bus = locator<TappingEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();

  UserDto loggedInUser;
  double amount = 0;

  TapService() {
    _bus.on<UserLoggedIn>().listen(_startTapping);
    _bus.on<UserLoggedOut>().listen(_finishTapping);
  }

  void tapAmount(double amount) async {
    if (this.loggedInUser == null) {
      return;
    }
    this.amount = amount;
    logger.i("User ${this.loggedInUser.name} tapped amount $amount");
    _bus.fire(new TapAmountUpdated(this.loggedInUser, amount));
  }

  void _startTapping(UserLoggedIn e) {
    this.loggedInUser = e.user;
    amount = 0;
    _openDraftView(this.loggedInUser);
  }

  void _finishTapping(UserLoggedOut event) async {
    if (this.loggedInUser == null) {
      logger.w(
          "Can not logout User ${event.user?.name} because of not being logged in");
      return;
    }
    if (this.amount < TOLERANCE) {
      _resetUser();
      _closeDraftView();
      return;
    }
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

  void _openDraftView(UserDto loggedInUser) async {
    locator<NavigationService>().navigateTo(RoutePaths.Tapping, loggedInUser);
  }

  void _closeDraftView() async {
    locator<NavigationService>().pop();
  }

  Future<DrawingDto> _persistDrawing() {
    return _db.drawingDao.saveDrawing(
        DrawingDto(null, this.loggedInUser.id, this.amount, DateTime.now()));
  }
}
