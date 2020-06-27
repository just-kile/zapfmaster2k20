import 'dart:async';

import 'package:zapfmaster2k20/ui/shared/base_view_model.dart';

class RevertDraftPageViewModel extends BaseViewModel {
  Future initialise() async {
    setBusy(true);
    setBusy(false);
  }

  void doSth() async {}

  @override
  void dispose() {
    super.dispose();
  }
}
