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

  Future fetchBestList() async {
    setBusy(true);
    comments = await _db.getBestList();
    setBusy(false);
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }
}
