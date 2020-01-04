import 'dart:math';

import 'package:zapfmaster2k20/core/domain/user.dart';

class BestListRepository {
  final random = Random();

  Future<List<User>> getBestList() async {
    // Get user profile for id
//    var nextInt = random.nextInt(10) + 1;
    var nextInt = 40;

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
}
