import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'user_dao.g.dart';

@UseDao(tables: [User])
class UserDao extends DatabaseAccessor<Zm2KDb> with _$UserDaoMixin {
  UserDao(Zm2KDb db) : super(db);

  Future<int> saveUser(UserDto userDto) {
    return into(user).insert(UserCompanion(
        name: Value(userDto.name),
        imagePath: Value(userDto.imagePath),
        hardwareToken: Value(userDto.hardwareToken)));
  }

  Future<UserDto> getUserByHardwareToken(String hardwareToken) async {
    final userData = await (select(user)
          ..where((u) => u.hardwareToken.equals(hardwareToken)))
        .getSingle();
    return UserDto.fromUserData(userData);
  }


  Future<List<UserData>> getAllUsers() {
    return select(user).get();
  }
}
