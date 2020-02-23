import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';

import '../database.dart';

part 'drawing_dao.g.dart';

class BestListEntry {
  BestListEntry(this.user, this.amount);

  final UserData user;
  final double amount;
}

class DrawingDto {
  final int id;
  final int userId;
  final double amount;
  final DateTime createdAt;

  DrawingDto(this.id, this.userId, this.amount, this.createdAt);
}

@UseDao(tables: [Drawing, User])
class DrawingDao extends DatabaseAccessor<Zm2KDb> with _$DrawingDaoMixin {
  DrawingDao(Zm2KDb db) : super(db);

  Future<List<BestListEntry>> getBestlistEntries() async {
    final drawingSum = drawing.amount.sum();
    final query = select(drawing)
        .join([innerJoin(user, drawing.userId.equalsExp(user.id))]);
    query
      ..addColumns([drawingSum])
      ..groupBy([drawing.userId]);

    final List<TypedResult> result = await query.get();
    return result
        .map((row) => BestListEntry(row.readTable(user), row.read(drawingSum)))
        .toList();
  }

  Future<int> saveDrawing(DrawingDto drawingData) {
    return into(drawing).insert(DrawingCompanion(
        userId: Value(drawingData.userId),
        amount: Value(drawingData.amount),
        createdAt: Value(DateTime.now())));
  }
}
