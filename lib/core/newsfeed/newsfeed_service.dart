import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';

class NewsFeedService {
  final TappingEventBus _bus = locator<TappingEventBus>();
  final Zm2KDb _db = locator<Zm2KDb>();

  StreamController<List<NewsItem>> _controller = BehaviorSubject();

  Stream<List<NewsItem>> get news => _controller.stream;

  NewsFeedService() {
    refreshNewsList();
    _bus.on<TapFinished>().listen(updateNewsFeed);
  }

  void updateNewsFeed(TapFinished event) async {
    //save event to derived db table
    await _db.newsDao.saveNews(
        NewsItem(event.user, UserTappedNewsDetails(event.amount)));
    //maybe fire BestListUpdated event
    await refreshNewsList();
  }

  Future refreshNewsList() async {
    _controller.add(await _db.newsDao.getNewsFeed(0, 10));
  }
}
