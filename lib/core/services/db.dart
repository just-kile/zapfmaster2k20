import 'dart:math';

import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/newsfeed/news_item.dart';

class Db {
  final random = Random();

  Future<User> getUserWithToken(String token) async {
    return User("1", "Usr" + random.nextInt(1000).toString(),
        "assets/testUser.jpg", token, 0.0);
  }
}
