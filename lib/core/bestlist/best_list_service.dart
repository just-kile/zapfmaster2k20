import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/best_list_entry.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';
import '../refresh_event_bus.dart';
import 'best_list_item_dto.dart';

class BestListService {
  final Zm2KDb _db = locator<Zm2KDb>();

  final TappingEventBus _bus = locator<TappingEventBus>();
  final RefreshEventBus _refreshEventBus = locator<RefreshEventBus>();
  StreamController<List<BestListItemDto>> _bestListController =
      BehaviorSubject();

  Stream<List<BestListItemDto>> get bestList => _bestListController.stream;

  BestListService() {
    _bus.on<TapFinished>().listen(updateBestList);
    _refreshEventBus.on<Refresh>().listen((event) => refreshBestlist());
  }

  void updateBestList(TapFinished event) async {
    refreshBestlist();
  }
  void refreshBestlist() async {
    _bestListController.add(await getBestList());
  }

  Future<List<BestListItemDto>> getBestList() async {
    final List<BestListEntry> bestlistEntries =
        await _db.drawingDao.getBestlistEntries();
    //Getting achievements here and merge them
    return bestlistEntries
        .map((dbEntry) => BestListItemDto.fromBestListEntry(dbEntry))
        .toList();
  }
}
