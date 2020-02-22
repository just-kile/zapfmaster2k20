import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/locator.dart';

class UserRepository {
  final Zm2KDb _db = locator<Zm2KDb>();

  Future<List<UserDto>> getBestList() async {
    return []; //_db.bestListDao.getDrawings();
  }
  Future<UserDto> getUserByHardwareToken(String hardwareToken) async {
    final userData = await _db.userDao.getUserByHardwareToken(hardwareToken);
    if(userData == null){
      return null;
    }
    return UserDto.fromUserData(userData);
  }

//  Future<int> save(UserDto drawing) async {
//    return _db.userDao.saveDrawing(DrawingCompanion(
//        userId: Value(drawing.userId),
//        amount: Value(drawing.amount),
//        createdAt: Value(DateTime.now())));
//  }
}
