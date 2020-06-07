import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';

class NewsFeedService {
  static final PAGE_SIZE = 10;
  final TappingEventBus _bus = locator<TappingEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();

  StreamController<List<NewsItem>> _controller = BehaviorSubject();

  Stream<List<NewsItem>> get news => _controller.stream;
  List<NewsItem> newsItems = [];

  NewsFeedService() {
    refreshNewsList();
    _bus.on<TapFinished>().listen(_updateNewsFeed);
  }

  void _updateNewsFeed(TapFinished event) async {
    //save event to derived db table
    await _db.newsDao.saveNews(
        NewsItem(event.user, event.drawingDto, UserTappedNewsDetails()));
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
    this.newsItems.addAll(additionalNewsItems);
    _controller.add(this.newsItems);
    return additionalNewsItems;
  }
}
