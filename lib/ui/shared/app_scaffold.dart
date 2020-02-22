import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/navigation/navigation_service.dart';

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

