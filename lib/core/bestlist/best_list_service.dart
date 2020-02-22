import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/domain/user.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';

import '../../locator.dart';
import 'best_list_repository.dart';

class BestListService {
  final BestListRepository _bestListRepository = locator<BestListRepository>();
  final TappingEventBus _bus = locator<TappingEventBus>();

  StreamController<List<UserDto>> _bestListController = BehaviorSubject();

  Stream<List<UserDto>> get bestList => _bestListController.stream;

  BestListService() {
    updateBestList(null);
    _bus.on<TapFinished>().listen(updateBestList);
  }

  void updateBestList(TapFinished event) async {
    if(event == null){
      return;
    }
    //save event to derived db table
    await _bestListRepository.save(DrawingDto.fromTapFinished(event));

    //maybe fire BestListUpdated event
    _bestListController.add(await _bestListRepository.getBestList());
  }

}
