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
      appBar:
          new AppBar(centerTitle: true, title: Image.asset("assets/logo.png", fit: BoxFit.fitHeight, height: 60)),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: [
            withBackgroundImage(BestList()),
            withBackgroundImage(NewsFeed()),
            withBackgroundImage(Settings())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
