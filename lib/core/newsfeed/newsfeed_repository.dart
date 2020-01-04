import 'dart:math';

import 'news_item.dart';

class NewsfeedRepository {
  final random = Random();

  Future<List<NewsItem>> getNewsFeed() async {
    // Get user profile for id
    var nextInt = random.nextInt(10) + 1;

    List list = List<NewsItem>();
    for (var i = 0; i < nextInt; i++) {
      list.add(ReachedAchievement());
    }

    return list;
  }}
