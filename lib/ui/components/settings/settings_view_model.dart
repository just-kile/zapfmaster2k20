import 'dart:async';

import 'package:zapfmaster2k20/core/newsfeed/news_item.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class SettingsViewModel extends BaseViewModel {

  void onData(List<NewsItem> news) async {
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

}
