import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/logger.dart';

import '../../locator.dart';
import '../refresh_event_bus.dart';

class NewsFeedService {
  static final PAGE_SIZE = 10;
  final TappingEventBus _bus = locator<TappingEventBus>();
  final RefreshEventBus _refreshEventBus = locator<RefreshEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();

  StreamController<List<NewsItem>> _controller = BehaviorSubject();

  Stream<List<NewsItem>> get news => _controller.stream;
  List<NewsItem> newsItems = [];

  NewsFeedService() {
    _bus.on<TapFinished>().listen(_updateNewsFeed);
    _bus.on<AchievementReached>().listen(_updateNewsFeedWithAchievement);
    _refreshEventBus.on<Refresh>().listen((event) => refreshNewsList());
  }

  void _updateNewsFeed(TapFinished event) async {
    //save event to derived db table
    await _db.newsDao.saveNews(
        NewsItem(event.user, event.drawingDto, null, UserTappedNewsDetails()));
    //maybe fire BestListUpdated event
    await refreshNewsList();
  }
  void _updateNewsFeedWithAchievement(AchievementReached event) async {
    //save event to derived db table
    var newsItem = NewsItem(event.user, null, event.achievement, NewAchievementReachedNewsDetails());
    logger.i("Saving achievement event ${newsItem.achievement?.id}");
    await _db.newsDao.saveNews(
        newsItem);
    //maybe fire BestListUpdated event
    await refreshNewsList();
  }

  Future refreshNewsList() async {
    var newsItems = await _db.newsDao.getNewsFeed(0, PAGE_SIZE);
    this.newsItems = newsItems;
    _controller.add(newsItems);
  }

  Future<List<NewsItem>> loadAdditionalNews() async {
    var additionalNewsItems =
        await _db.newsDao.getNewsFeed(this.newsItems.length, PAGE_SIZE);
    if (additionalNewsItems.length == 0) {
      return [];
    }
    this.newsItems.addAll(additionalNewsItems);
    _controller.add(this.newsItems);
    return additionalNewsItems;
  }
}
