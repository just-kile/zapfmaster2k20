import 'package:moor/moor.dart';
import 'package:zapfmaster2k20/core/db/domain/achievement_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';
import 'package:zapfmaster2k20/core/db/tables/achievement.dart';
import 'package:zapfmaster2k20/core/db/tables/drawing.dart';
import 'package:zapfmaster2k20/core/db/tables/news.dart';
import 'package:zapfmaster2k20/core/db/tables/user.dart';

import '../database.dart';

part 'news_dao.g.dart';

@UseDao(tables: [News, User, Drawing, Achievement])
class NewsDao extends DatabaseAccessor<Zm2KDb> with _$NewsDaoMixin {
  NewsDao(Zm2KDb db) : super(db);

  Future<List<NewsItem>> getNewsFeed(int offset, int limit) async {
    final query = select(news).join([
      leftOuterJoin(user, news.userId.equalsExp(user.id)),
      leftOuterJoin(drawing, news.drawingId.equalsExp(drawing.id)),
      leftOuterJoin(achievement, news.achievementId.equalsExp(achievement.id))
    ]);

    query
      ..orderBy(
          [OrderingTerm(expression: news.createdAt, mode: OrderingMode.desc)])
      ..limit(limit, offset: offset);
    final List<TypedResult> result = await query.get();
    return result.map((row) {
      var newsItem = row.readTable(news);
      return NewsItem(
          UserDto.fromUserData(row.readTable(user)),
          DrawingDto.fromDrawingData(row.readTable(drawing)),
          AchievementDto.fromAchievementData(row.readTable(achievement)),
          newsItem.newsDetails,
          newsItem.createdAt);
    }).toList();
  }

  Future<int> saveNews(NewsItem newsItem) async {
    return into(news).insert(NewsCompanion(
        userId: Value(newsItem.user?.id),
        drawingId: Value(newsItem.drawing?.id),
        achievementId: Value(newsItem.achievement?.id),
        newsDetails: Value(newsItem.details),
        createdAt: Value(DateTime.now())));
  }

  Future<List<int>> getAchievementListForUser(int userId) async {
    final query = select(news)
      ..where((d) => d.userId.equals(userId) & isNotNull(d.achievementId));
    var list = await query.get();
    return list.map((newsItem) => newsItem.achievementId).toList();
  }
}
