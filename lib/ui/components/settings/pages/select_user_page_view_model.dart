import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';
import '../../../../logger.dart';

class SelectUserPageViewModel extends BaseViewModel {
  final Zm2KDb _db = locator<Zm2KDb>();
  List<UserDto> list;

  Future initialise(UserDto user) async {
    setBusy(true);
    list = await _db.userDao.getAllUsers();
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
