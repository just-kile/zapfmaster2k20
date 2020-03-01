import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';

class NewsItem {
  final UserDto user;

  final NewsDetails details;

  NewsItem(this.user, this.details);
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
class UserTappedNewsDetails extends NewsDetails {
  String amount;

  UserTappedNewsDetails(String amount);
}
