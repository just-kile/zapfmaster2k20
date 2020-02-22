import 'dart:math';

import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/domain/user.dart' as UserDto;
import 'package:zapfmaster2k20/locator.dart';

class BestListRepository {
  final random = Random();
  final Zm2KDb _db = locator<Zm2KDb>();

  Future<List<UserDto.UserDto>> getBestList() async {
    return []; //_db.bestListDao.getDrawings();
  }

  Future<int> save(DrawingDto drawing) async {
    return _db.bestListDao.saveDrawing(DrawingCompanion(
        userId: Value(drawing.userId),
        amount: Value(drawing.amount),
        createdAt: Value(DateTime.now())));
  }
}
