import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class BestListViewModel extends BaseViewModel {
  Db _db;

  BestListViewModel({
    @required Db db,
  }) : _db = db;

  List<User> bestlist = [];

  void timerCb(Timer timer) async {
    print('Timer called');
    bestlist = await _db.getBestList();
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    bestlist = await _db.getBestList();

    new Timer.periodic(const Duration(seconds: 4), timerCb);
    setBusy(false);
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }
}
