import 'dart:math';

import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/daos/drawing_dao.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/bestlist/drawing_dto.dart';
import 'package:zapfmaster2k20/locator.dart';

import 'best_list_item_dto.dart';

class BestListRepository {
  final random = Random();
  final Zm2KDb _db = locator<Zm2KDb>();

  Future<List<BestListItemDto>> getBestList() async {
    final List<BestListEntry> bestlistEntries =
        await _db.drawingDao.getBestlistEntries();
    return bestlistEntries
        .map((dbEntry) => BestListItemDto.fromBestListEntry(dbEntry))
        .toList();
  }

  Future<int> save(DrawingDto drawing) async {
    return _db.drawingDao.saveDrawing(DrawingCompanion(
        userId: Value(drawing.userId),
        amount: Value(drawing.amount),
        createdAt: Value(DateTime.now())));
  }
}
