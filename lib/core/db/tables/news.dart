import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';

class News extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().nullable()();

  IntColumn get drawingId => integer().nullable()();

  // every relation should be defined here as a nullable field
//  IntColumn get achievementId => integer().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  TextColumn get newsDetails =>
      text().map(const NewsDetailsConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}


// stores preferences as strings
class NewsDetailsConverter extends TypeConverter<NewsDetails, String> {
  const NewsDetailsConverter();

  @override
  NewsDetails mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return JsonMapper.deserialize(fromDb);
  }

  @override
  String mapToSql(NewsDetails value) {
    if (value == null) {
      return null;
    }

    return JsonMapper.serialize(value);
  }
}
