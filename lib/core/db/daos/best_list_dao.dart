import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';

import '../database.dart';

part 'best_list_dao.g.dart';

@UseDao(tables: [Drawing])
class BestListDao extends DatabaseAccessor<Zm2KDb> with _$BestListDaoMixin {
  BestListDao(Zm2KDb db) : super(db);

  Future<List<DrawingData>> getDrawings() {

    return select(drawing).get();
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
