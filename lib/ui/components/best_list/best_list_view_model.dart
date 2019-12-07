import 'dart:async';

import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/services/user_service.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

import '../../../locator.dart';

class BestListViewModel extends BaseViewModel {
  UserService _userService = locator<UserService>();
  StreamSubscription<List<User>> _streamSubscription;
  List<User> bestlist = [];

  void onData(List<User> users) async {
    this.bestlist = users;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    this._streamSubscription = _userService.users.listen(onData);
    setBusy(false);
  }

  @override
  void dispose() {
    this._streamSubscription.cancel();
    super.dispose();
  }
}
