import 'dart:async';

import 'package:zapfmaster2k20/core/db/domain/news_item.dart';
import 'package:zapfmaster2k20/core/newsfeed/newsfeed_service.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../locator.dart';

class NewsFeedViewModel extends BaseViewModel {
  NewsFeedService _newsFeedService = locator<NewsFeedService>();
  StreamSubscription<List<NewsItem>> _streamSubscription;
  List<NewsItem> news = [];

  void _onData(List<NewsItem> news) async {
    this.news = news;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    this._streamSubscription = _newsFeedService.news.listen(_onData);
    setBusy(false);
  }

  Future loadMoreData() async {
    await _newsFeedService.loadAdditionalNews();
  }

  @override
  void dispose() {
    this._streamSubscription.cancel();
    super.dispose();
  }

}
