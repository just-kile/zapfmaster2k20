import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/core/user/user_dto.dart';

import '../../locator.dart';

class TappingState {
  final UserDto userDto;
  final double amount;

  TappingState(this.userDto, this.amount);
}

class TapUpdateService {
  final TappingEventBus _bus = locator<TappingEventBus>();

  StreamController<TappingState> _controller = BehaviorSubject();

  Stream<TappingState> get tappingState => _controller.stream;

  TapUpdateService() {
    _bus.on<TapAmountUpdated>().listen(onTapUpdate);
  }

  void onTapUpdate(TapAmountUpdated event) async {
    if (event == null) {
      return;
    }

    _controller.add(TappingState(event.user, event.amount));
  }
}
