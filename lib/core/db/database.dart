// These imports are only needed to open the database
import 'dart:io';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import 'daos/best_list_dao.dart';
import 'daos/user_dao.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Drawing, User], daos: [BestListDao, UserDao])
class Zm2KDb extends _$Zm2KDb {
  // we tell the database where to store the data with this constructor
  Zm2KDb() : super(_openConnection());

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        print("DB created");
        return m.createAll();
      },
      beforeOpen: (details) async {
        print("Bootstrap users");
        if (details.wasCreated) {
          print("Bootstrap users was created");
          [
            UserCompanion(name: Value("Pete"), hardwareToken: Value("1")),
            UserCompanion(name: Value("Karl"), hardwareToken: Value("2")),
            UserCompanion(name: Value("Zoghurt"), hardwareToken: Value("3")),
            UserCompanion(name: Value("Brain"), hardwareToken: Value("4"))
          ].map((userCompanion) async => into(user).insert(userCompanion));
        }
      },
    );
    // you should bump this number whenever you change or add a table definition. Migrations
    // are covered later in this readme.
  }

  @override
  int get schemaVersion => 2;
}
