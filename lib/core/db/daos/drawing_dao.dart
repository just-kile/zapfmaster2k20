import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/best_list_entry.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/news.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'drawing_dao.g.dart';

@UseDao(tables: [Drawing, User, News])
class DrawingDao extends DatabaseAccessor<Zm2KDb> with _$DrawingDaoMixin {
  DrawingDao(Zm2KDb db) : super(db);

  Future<List<BestListEntry>> getBestlistEntries() async {
    final drawingSum = drawing.amount.sum();
    final query = select(drawing)
        .join([innerJoin(user, drawing.userId.equalsExp(user.id))]);
    query
      ..addColumns([drawingSum])
      ..groupBy([drawing.userId])
      ..orderBy(
          [OrderingTerm(expression: drawingSum, mode: OrderingMode.desc)]);

    final List<TypedResult> result = await query.get();
    return result
        .map((row) => BestListEntry(
            UserDto.fromUserData(row.readTable(user)), row.read(drawingSum)))
        .toList();
  }

  Future<List<DrawingWithUserDto>> getDrawings(int offset, int limit) async {
    final query = select(drawing)
        .join([innerJoin(user, drawing.userId.equalsExp(user.id))]);
    query
      ..orderBy([
        OrderingTerm(expression: drawing.createdAt, mode: OrderingMode.desc)
      ])
      ..limit(limit, offset: offset);

    final List<TypedResult> result = await query.get();
    return result
        .map((row) => DrawingWithUserDto(
            DrawingDto.fromDrawingData(row.readTable(drawing)),
            UserDto.fromUserData(row.readTable(user))))
        .toList();
  }
  Future<void> deleteDrawing(DrawingDto drawingDto) async {
    return transaction(() async {
      await customUpdate(
        'DELETE from news WHERE drawing_id = ?',
        updates: {news},
        variables: [Variable.withInt(drawingDto.id)],
      );

      // then, delete the category
      await customUpdate(
        'DELETE from drawing WHERE id = ?',
        updates: {drawing},
        variables: [Variable.withInt(drawingDto.id)],
      );
    });
//    delete(news).delete()
//    delete(drawing).delete(DrawingData(drawingDto)
  }
  Future<DrawingDto> saveDrawing(DrawingDto drawingData) async {
    var drawingCompanion = DrawingCompanion(
        userId: Value(drawingData.userId),
        amount: Value(drawingData.amount),
        createdAt: Value(DateTime.now()));
    var drawingId = await into(drawing).insert(drawingCompanion);
    return DrawingDto.from(drawingCompanion.copyWith(id: Value(drawingId)));
  }
}
