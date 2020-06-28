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

class NewUserPageViewModel extends BaseViewModel {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();
  StreamSubscription _streamSubscription;
  String token;
  String imagePath;
  final userNameController = TextEditingController();
  CameraController cameraController;

  Future initialise() async {
    setBusy(true);
    this._streamSubscription =
        _bus.on<UnknownLoginDeviceRecognized>().listen(onData);
    await cameraController.initialize();
    setBusy(false);
  }

  Future<int> createUser() async {
    logger.i("Create user ${userNameController.text} with token ${token}");
    return _db.userDao
        .saveUser(new UserDto(0, userNameController.text, "imagePath", token));
  }

  Future<int> takePhoto() async {
    logger.i("Taking photo");
    final cameras = await availableCameras();
    cameraController = CameraController(
      cameras.first,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    this.imagePath = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getApplicationDocumentsDirectory()).path,
      '${DateTime.now()}.png',
    );

    cameraController.takePicture(this.imagePath);
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
  }
}
