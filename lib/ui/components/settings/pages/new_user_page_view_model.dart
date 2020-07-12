import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/refresh_event_bus.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';
import '../../../../logger.dart';

class NewUserPageViewModel extends BaseViewModel {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final RefreshEventBus _refreshEventBus = locator<RefreshEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();
  StreamSubscription _streamSubscription;
  String token;
  String imagePath;
  UserDto previousUser;
  final userNameController = TextEditingController();
  CameraController cameraController;

  Future initialise(UserDto user) async {
    setBusy(true);
    previousUser = user;
    if (user != null) {
      userNameController.text = previousUser.name;
      imagePath = previousUser.imagePath;
      token = previousUser.hardwareToken;
    }
    this._streamSubscription =
        _bus.on<UnknownLoginDeviceRecognized>().listen(onData);
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras.first,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    await cameraController.initialize();
    setBusy(false);
  }

  Future<int> createUser() async {
    var userDto = new UserDto(
        previousUser != null ? previousUser.id : 0,
        userNameController.text,
        imagePath,
        token);
    logger.i("Saving user ${userDto.id},${userDto.imagePath}, ${userDto.hardwareToken}");
    var userId = await _db.userDao.saveUser(userDto);
    _refreshEventBus.fire(new Refresh());
    return userId;
  }

  Future<int> takePhoto() async {
    logger.i("Taking photo");

    this.imagePath = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getApplicationDocumentsDirectory()).path,
      '${DateTime.now()}.png',
    );

    await cameraController.takePicture(this.imagePath);
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    userNameController.dispose();
    cameraController?.dispose();
    super.dispose();
  }

  void onData(UnknownLoginDeviceRecognized event) {
    this.token = event.hardwareToken;
    notifyListeners();
  }

  void resetImage() {
    this.imagePath = null;
    notifyListeners();
  }
}
