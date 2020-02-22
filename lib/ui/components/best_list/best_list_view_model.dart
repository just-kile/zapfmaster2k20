import 'dart:async';

import 'package:zapfmaster2k20/core/bestlist/best_list_item_dto.dart';
import 'package:zapfmaster2k20/core/bestlist/best_list_service.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../locator.dart';

class BestListViewModel extends BaseViewModel {
  BestListService _bestListService = locator<BestListService>();
  StreamSubscription<List<BestListItemDto>> _streamSubscription;
  List<BestListItemDto> bestlist = [];

  void onData(List<BestListItemDto> users) async {
    this.bestlist = users;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    final bestlist = await _bestListService.getBestList();
    onData(bestlist);
    this._streamSubscription = _bestListService.bestList.listen(onData);
    setBusy(false);
  }

  void resetStreamSubscription() {
    this._streamSubscription.cancel();
  }

  @override
  void dispose() {
    resetStreamSubscription();
    super.dispose();
  }
}
