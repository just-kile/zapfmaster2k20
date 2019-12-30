import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';

class BestListService {
  final Db _db = locator<Db>();
  final TappingEventBus _bus = locator<TappingEventBus>();

  StreamController<List<User>> _bestListController = BehaviorSubject();
  Stream<List<User>> get bestList => _bestListController.stream;

  BestListService() {
    updateBestList(null);
    _bus.on<TapFinished>().listen(updateBestList);
  }

  void updateBestList(TapFinished event) async {
    //save event to derived db table
    //maybe fire BestListUpdated event
    _bestListController.add(await _db.getBestList());
  }

}
