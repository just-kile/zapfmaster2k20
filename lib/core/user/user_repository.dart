import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/locator.dart';

class UserRepository {
  final Zm2KDb _db = locator<Zm2KDb>();

  Future<UserDto> getUserByHardwareToken(String hardwareToken) async {
    return _db.userDao.getUserByHardwareToken(hardwareToken);
  }

}
