import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/news.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'news_dao.g.dart';

@UseDao(tables: [News, User, Drawing])
class NewsDao extends DatabaseAccessor<Zm2KDb> with _$NewsDaoMixin {
  NewsDao(Zm2KDb db) : super(db);

  Future<List<NewsItem>> getNewsFeed(int offset, int limit) async {
    final query = select(news).join([
      leftOuterJoin(user, news.userId.equalsExp(user.id)),
      leftOuterJoin(drawing, news.drawingId.equalsExp(drawing.id))
    ]);

    query
      ..orderBy(
          [OrderingTerm(expression: news.createdAt, mode: OrderingMode.desc)])
      ..limit(limit, offset: offset);
    final List<TypedResult> result = await query.get();
    return result
        .map((row) => NewsItem(
            UserDto.fromUserData(row.readTable(user)),
            DrawingDto.fromDrawingData(row.readTable(drawing)),
            row.readTable(news).newsDetails))
        .toList();
  }

  Future<int> saveNews(NewsItem newsItem) async {
    return into(news).insert(NewsCompanion(
        userId: Value(newsItem.user?.id),
        drawingId: Value(newsItem.drawing?.id),
        newsDetails: Value(newsItem.details),
        createdAt: Value(DateTime.now())));
  }
}
