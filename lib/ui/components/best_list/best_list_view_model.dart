import 'dart:async';

import 'package:zapfmaster2k20/core/bestlist/best_list_service.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../locator.dart';

class BestListViewModel extends BaseViewModel {
  BestListService _bestListService = locator<BestListService>();
  StreamSubscription<List<UserDto>> _streamSubscription;
  List<UserDto> bestlist = [];

  void onData(List<UserDto> users) async {
    this.bestlist = users;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
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
