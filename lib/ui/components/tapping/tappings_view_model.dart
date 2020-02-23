import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/core/user/user_dto.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class TappingState {
  final UserDto userDto;
  final double amount;

  TappingState(this.userDto, this.amount);

  static TappingState fromTapAmountUpdated(TapAmountUpdated event) {
    return TappingState(event.user, event.amount);
  }
}

class TappingViewModel extends BaseViewModel {
  final TappingEventBus _bus = locator<TappingEventBus>();
  StreamSubscription<TapAmountUpdated> _streamSubscription;
  TappingState state;

  void onData(TapAmountUpdated event) async {
    this.state = TappingState.fromTapAmountUpdated(event);
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    this._streamSubscription = _bus.on<TapAmountUpdated>().listen(onData);
    setBusy(false);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
