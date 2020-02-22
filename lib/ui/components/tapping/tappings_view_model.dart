import 'dart:async';

import 'package:zapfmaster2k20/core/newsfeed/news_item.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class TappingViewModel extends BaseViewModel {


  Future initialise() async {
    setBusy(true);
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

}
