import 'dart:async';

import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/draft_measuring/events.dart';
import 'package:zapfmaster2k20/core/draft_measuring/user_event_bus.dart';
import 'package:zapfmaster2k20/core/services/db.dart';

import '../../locator.dart';

class BestListService {
  final Db _db = locator<Db>();
  final UserEventBus _bus = locator<UserEventBus>();

  StreamController<List<User>> _bestListController = StreamController<List<User>>();

  Stream<List<User>> get bestList => _bestListController.stream;

  BestListService() {
    updateBestList(null);
    _bus.on<TapFinished>().listen(updateBestList);
  }

  void updateBestList(TapFinished event) async {
    //save event to derived db
    //maybe fire BestListUpdated event
    _bestListController.add(await _db.getBestList());
  }

}
