import 'package:moor/moor.dart';

class Drawing extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  RealColumn get amount => real()();

  DateTimeColumn get createdAt=> dateTime()();
}
