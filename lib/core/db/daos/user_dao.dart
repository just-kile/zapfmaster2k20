import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'user_dao.g.dart';

@UseDao(tables: [User])
class UserDao extends DatabaseAccessor<Zm2KDb> with _$UserDaoMixin {
  UserDao(Zm2KDb db) : super(db);

  Future<int> saveUser(UserCompanion userCompanion) {
    return into(user).insert(userCompanion);
  }

  Future<UserData> getUserByHardwareToken(String hardwareToken) {
    return (select(user)..where((u) => u.hardwareToken.equals(hardwareToken)))
        .getSingle();
  }

  Future<List<UserData>> getAllUsers() {
    return select(user).get();
  }
}
