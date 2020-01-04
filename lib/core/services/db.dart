import 'dart:math';

import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/newsfeed/news_item.dart';

class Db {
  final random = Random();

  Future<List<User>> getBestList() async {
    // Get user profile for id
    var nextInt = random.nextInt(10) + 1;

    List list = List<User>();
    for (var i = 0; i < nextInt; i++) {
      list.add(User(
          "1",
          "Usr" + random.nextInt(1000).toString(),
          "assets/testUser.jpg",
          "hardware token",
          double.parse((10 * random.nextDouble()).toStringAsFixed(2))));
    }

    return list;
  }

  Future<List<NewsItem>> getNewsFeed() async {
    // Get user profile for id
    var nextInt = random.nextInt(10) + 1;

    List list = List<NewsItem>();
    for (var i = 0; i < nextInt; i++) {
      list.add(ReachedAchievement());
    }

    return list;
  }

  Future<User> getUserWithToken(String token) async {
    return User("1", "Usr" + random.nextInt(1000).toString(),
        "assets/testUser.jpg", token, 0.0);
  }
}
