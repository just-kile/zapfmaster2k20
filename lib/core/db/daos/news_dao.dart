import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/news.dart';
import 'package:zapfmaster2k20/core/newsfeed/news_item.dart';

import '../database.dart';

part 'news_dao.g.dart';

@UseDao(tables: [News])
class NewsDao extends DatabaseAccessor<Zm2KDb> with _$NewsDaoMixin {
  NewsDao(Zm2KDb db) : super(db);

  Future<List<NewsItem>> getNewsFeed() async {
    return [UserTapped(UserDto(1, "Foo", "test", "1"), 1.2)];
  }
}
