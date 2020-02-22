import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'best_list_dao.g.dart';

class BestListEntry {
  BestListEntry(this.user, this.amount);

  final UserData user;
  final double amount;
}

@UseDao(tables: [Drawing, User])
class BestListDao extends DatabaseAccessor<Zm2KDb> with _$BestListDaoMixin {
  BestListDao(Zm2KDb db) : super(db);

  Future<List<BestListEntry>> getBestlistEntries() async {
    final drawingSum = drawing.amount.sum();
    final query = select(drawing).join([
      innerJoin(user, drawing.userId.equalsExp(user.id))
    ]);
    query
      ..addColumns([drawingSum])
      ..groupBy([drawing.userId]);

    final List<TypedResult> result = await query.get();
    return result
        .map((row) => BestListEntry(row.readTable(user), row.read(drawingSum)))
        .toList();
  }

  Future<int> saveDrawing(DrawingCompanion drawingData) {
    return into(drawing).insert(drawingData);
  }
//    if (category == null) {
//      return (select(drawin)..where((t) => isNull(t.category))).watch();
//    } else {
//      return (select(todos)..where((t) => t.category.equals(category.id)))
//          .watch();
//    }
//  }
}
