import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/news.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'news_dao.g.dart';

@UseDao(tables: [News, User])
class NewsDao extends DatabaseAccessor<Zm2KDb> with _$NewsDaoMixin {
  NewsDao(Zm2KDb db) : super(db);

  Future<List<NewsItem>> getNewsFeed(int offset, int limit) async {
    final query =
        select(news).join([innerJoin(user, news.userId.equalsExp(user.id))]);

    query
      ..orderBy(
          [OrderingTerm(expression: news.createdAt, mode: OrderingMode.desc)]);
    final List<TypedResult> result = await query.get();
    return result
        .map((row) => NewsItem(UserDto.fromUserData(row.readTable(user)),
            row.readTable(news).newsDetails))
        .toList();
  }
}
