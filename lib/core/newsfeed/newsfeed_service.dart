import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/newsfeed/news_item.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';
import 'newsfeed_repository.dart';

class NewsFeedService {
  final NewsfeedRepository _db = locator<NewsfeedRepository>();
  final TappingEventBus _bus = locator<TappingEventBus>();

  StreamController<List<NewsItem>> _controller = BehaviorSubject();

  Stream<List<NewsItem>> get news => _controller.stream;

  NewsFeedService() {
    refreshNewsList();
    _bus.on<TapFinished>().listen(updateNewsFeed);
  }

  void updateNewsFeed(TapFinished event) async {
    //save event to derived db table
    //maybe fire BestListUpdated event
    await refreshNewsList();
  }

  Future refreshNewsList() async {
    _controller.add(await _db.getNewsFeed());
  }
}
