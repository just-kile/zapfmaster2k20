import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/best_list_entry.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'drawing_dao.g.dart';


@UseDao(tables: [Drawing, User])
class DrawingDao extends DatabaseAccessor<Zm2KDb> with _$DrawingDaoMixin {
  DrawingDao(Zm2KDb db) : super(db);

  Future<List<BestListEntry>> getBestlistEntries() async {
    final drawingSum = drawing.amount.sum();
    final query = select(drawing)
        .join([innerJoin(user, drawing.userId.equalsExp(user.id))]);
    query
      ..addColumns([drawingSum])
      ..groupBy([drawing.userId])
      ..orderBy([OrderingTerm(expression: drawingSum)]);

    final List<TypedResult> result = await query.get();
    return result
        .map((row) => BestListEntry(
            UserDto.fromUserData(row.readTable(user)), row.read(drawingSum)))
        .toList();
  }

  Future<int> saveDrawing(DrawingDto drawingData) {
    return into(drawing).insert(DrawingCompanion(
        userId: Value(drawingData.userId),
        amount: Value(drawingData.amount),
        createdAt: Value(DateTime.now())));
  }
}
