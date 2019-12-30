import 'package:flutter/material.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed.dart';
import 'package:zapfmaster2k20/ui/shared/app_scaffold.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return withAppScaffold(NewsFeed(), 1);
  }
}
