import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';

import 'achievement_dto.dart';

class NewsItem {
  final UserDto user;
  final DrawingDto drawing;
  final AchievementDto achievement;

  final NewsDetails details;

  NewsItem(this.user, this.drawing, this.achievement, this.details);
}

void initNewsDetailsJsonMapper() {
  JsonMapper().useAdapter(JsonMapperAdapter(valueDecorators: {
    typeOf<List<NewsDetails>>(): (value) => value.cast<NewsDetails>()
  }));
}

@jsonSerializable
@Json(typeNameProperty: 'typeName')
abstract class NewsDetails {}

@jsonSerializable
class UserTappedNewsDetails extends NewsDetails {}

class NewAchievementReachedNewsDetails extends NewsDetails {}
