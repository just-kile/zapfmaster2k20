import 'package:flutter/material.dart';

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

