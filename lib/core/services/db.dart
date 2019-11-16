import 'package:zapfmaster2k20/core/domain/user.dart';

class Db {
  Future<List<User>> getBestList() async {
    // Get user profile for id

    List list = List<User>();
    list.add(User("1", "Usr1", "image path", "hardware token", 0.0));
    // Convert and return
    return list;
  }
}
