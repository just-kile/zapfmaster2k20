import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';

ImageProvider UserImage(UserDto user) {
  return user?.imagePath != null
      ? FileImage(File(user?.imagePath))
      : AssetImage("assets/testUser.jpg");
}

