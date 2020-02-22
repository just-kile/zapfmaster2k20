import 'package:moor/moor.dart';

class User extends Table {
  IntColumn get  id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get hardwareToken => text().nullable()();
}