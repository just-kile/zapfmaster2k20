import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class BestListModel extends BaseViewModel {
  Db _db;

  BestListModel({
    @required Db db,
  }) : _db = db;

  List<User> comments;

  StreamController<List<User>> _bestListController =
      StreamController<List<User>>();

  Stream<List<User>> get bestList => _bestListController.stream;

  void timerCb(Timer timer) async {
    print('Timer called');
    comments = await _db.getBestList();
    _bestListController.add(comments);
  }

  Future fetchBestList() async {
    setBusy(true);
    comments = await _db.getBestList();
    _bestListController.add(comments);

    new Timer.periodic(const Duration(seconds: 4), timerCb);
    setBusy(false);
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    _bestListController.close();
    super.dispose();
  }
}
