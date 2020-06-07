import 'dart:async';

import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/newsfeed/newsfeed_service.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../locator.dart';

class NewsFeedViewModel extends BaseViewModel {
  NewsFeedService _newsFeedService = locator<NewsFeedService>();
  StreamSubscription<List<NewsItem>> _streamSubscription;
  List<NewsItem> news = [];
  bool lastItemLoaded = false;

  void _onData(List<NewsItem> news) async {
    this.news = news;
    print("on data " + news.length.toString());
    lastItemLoaded = false;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    this._streamSubscription = _newsFeedService.news.listen(_onData);
    setBusy(false);
  }

  Future loadMoreData() async {
    if (lastItemLoaded) {
      return;
    }
    print("Load more data");
    var additionalNews = await _newsFeedService.loadAdditionalNews();
    print("Load more data " + additionalNews.length.toString());
    if (additionalNews.length == 0) {
      lastItemLoaded = true;
    }
  }

  @override
  void dispose() {
    this._streamSubscription.cancel();
    super.dispose();
  }
}
