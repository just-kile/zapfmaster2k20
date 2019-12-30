import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/core/services/navigation_service.dart';
import 'package:zapfmaster2k20/ui/shared/zm_custom_icons_icons.dart';

import '../../locator.dart';

Container withBackgroundImage(Widget child) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/drops.png"),
        repeat: ImageRepeat.repeat,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[child],
    ),
  );
}

