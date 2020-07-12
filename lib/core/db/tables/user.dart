import 'package:moor/moor.dart';

class User extends Table {
  IntColumn get  id => integer().autoIncrement().customConstraint("UNIQUE")();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get hardwareToken => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};

}