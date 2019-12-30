import 'dart:async';

import 'package:zapfmaster2k20/core/bestlist/best_list_service.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../locator.dart';

class BestListViewModel extends BaseViewModel {
  BestListService _bestListService = locator<BestListService>();
  StreamSubscription<List<User>> _streamSubscription;
  List<User> bestlist = [];

  void onData(List<User> users) async {
    this.bestlist = users;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    resetStreamSubscription();
    this._streamSubscription = _bestListService.bestList.listen(onData);
    setBusy(false);
  }

  void resetStreamSubscription() {
    if(this._streamSubscription != null){
      this._streamSubscription.cancel();
    }

  }

  @override
  void dispose() {
    print("Reset stream subscription");
    resetStreamSubscription();
    super.dispose();
  }
}
