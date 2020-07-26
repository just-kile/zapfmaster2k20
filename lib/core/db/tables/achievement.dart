import 'package:moor/moor.dart';

class Achievement extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().nullable()();

  TextColumn get description => text().nullable()();

  TextColumn get imagePath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
