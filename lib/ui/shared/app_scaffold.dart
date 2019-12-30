import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/core/services/navigation_service.dart';
import 'package:zapfmaster2k20/ui/shared/zm_custom_icons_icons.dart';

import '../../locator.dart';

BottomNavigationBar buildBottomNavigationBar(int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (int index) {
      if (index == currentIndex) {
        return;
      }
      var route = [RoutePaths.Overview, RoutePaths.NewsFeed][index];
      locator<NavigationService>().navigateTo(route);
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(ZmCustomIcons.ic_menu_ranking_1),
        title: new Text('Ranking'),
      ),
      BottomNavigationBarItem(
          icon: Icon(ZmCustomIcons.ic_menu_news_1), title: Text('News'))
    ],
  );
}

Container withBackgroundImage(Widget child) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/drops.png"),
        repeat: ImageRepeat.repeat,
      ),
    ),
    child: child,
  );
}

Scaffold withAppScaffold(Widget child, int index) {
  return Scaffold(
    appBar:
        new AppBar(centerTitle: true, title: Image.asset("assets/logo.png")),
    bottomNavigationBar: buildBottomNavigationBar(index),
    body: withBackgroundImage(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[child],
      ),
    ),
  );
}
