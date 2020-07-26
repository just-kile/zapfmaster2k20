import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed.dart';
import 'package:zapfmaster2k20/ui/components/settings/settings.dart';
import 'package:zapfmaster2k20/ui/shared/app_scaffold.dart';
import 'package:zapfmaster2k20/ui/shared/zm_custom_icons_icons.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview>
    with TickerProviderStateMixin<Overview> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            centerTitle: true,
            title: Image.asset("assets/logo.png",
                fit: BoxFit.fitHeight, height: 60)),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? buildVerticalContent()
                : buildHorizontalContent();
          },
        ),
        bottomNavigationBar: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? buildVerticalBottomNavigationBar()
                : buildHorizontalBottomNavigationBar();
          },
        ));
  }

  BottomNavigationBar buildVerticalBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(ZmCustomIcons.ic_menu_ranking_1),
          title: new Text('Ranking'),
        ),
        BottomNavigationBarItem(
            icon: Icon(ZmCustomIcons.ic_menu_news_1), title: Text('News')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Einstellungen'))
      ],
    );
  }

  BottomNavigationBar buildHorizontalBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: min(_currentIndex, 1),
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(ZmCustomIcons.ic_menu_ranking_1),
          title: new Text('Ranking'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Einstellungen'))
      ],
    );
  }

  SafeArea buildVerticalContent() {
    return SafeArea(
      top: false,
      child: IndexedStack(
        index: _currentIndex,
        children: [
          withBackgroundImage(Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[Expanded(child: BestList())]))),
          withBackgroundImage(Expanded(child: NewsFeed())),
          withBackgroundImage(Expanded(child: Settings()))
        ],
      ),
    );
  }

  SafeArea buildHorizontalContent() {
    return SafeArea(
        top: false,
        child: IndexedStack(index: min(_currentIndex, 1), children: [
          withBackgroundImage(Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(16.0), child: BestList())),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(16.0), child: NewsFeed()))
              ]))),
          withBackgroundImage(Expanded(child: Settings())),
        ]));
  }
}
