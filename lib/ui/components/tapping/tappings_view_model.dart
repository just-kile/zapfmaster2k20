import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/tap_update_service.dart';
import 'package:zapfmaster2k20/locator.dart';
import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class TappingViewModel extends BaseViewModel {
  final TapUpdateService _tapUpdateService = locator<TapUpdateService>();
  StreamSubscription<TappingState> _streamSubscription;
  TappingState state;

  void onData(TappingState state) async {
    this.state = state;
    notifyListeners();
  }

  Future initialise() async {
    setBusy(true);
    this._streamSubscription = _tapUpdateService.tappingState.listen(onData);
    setBusy(false);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

}
