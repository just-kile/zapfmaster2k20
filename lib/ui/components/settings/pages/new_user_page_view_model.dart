import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';
import '../../../../logger.dart';
class NewUserPageViewModel extends BaseViewModel {

  final TappingEventBus _bus = locator<TappingEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();
  StreamSubscription _streamSubscription;
  String token;
  final userNameController = TextEditingController();

  Future initialise() async {
    setBusy(true);
    this._streamSubscription = _bus.on<UnknownLoginDeviceRecognized>().listen(onData);
    setBusy(false);
  }

  Future<int> createUser() async {
    logger.i("Create user ${userNameController.text} with token ${token}");
    return _db.userDao.saveUser(new UserDto(0, userNameController.text, "imagePath", token));
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    userNameController.dispose();
    super.dispose();
  }

  void onData(UnknownLoginDeviceRecognized event) {
    this.token = event.hardwareToken;
  }
}

