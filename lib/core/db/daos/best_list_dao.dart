import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'best_list_dao.g.dart';

class BestListEntry {
  BestListEntry(this.user, this.drawing);

  final UserData user;
  final DrawingData drawing;
}

@UseDao(tables: [Drawing, User])
class BestListDao extends DatabaseAccessor<Zm2KDb> with _$BestListDaoMixin {
  BestListDao(Zm2KDb db) : super(db);

  Future<List<BestListEntry>> getBestlistEntries() {
    final query = select(drawing)
        .join([leftOuterJoin(user, drawing.userId.equalsExp(user.id))]);
    return query.watch().map((rows) {
      return rows.map((row) {
        return BestListEntry(row.readTable(user), row.readTable(drawing));
      }).toList();
    }).single;
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
