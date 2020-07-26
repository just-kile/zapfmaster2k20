import 'dart:async';
import 'dart:math';

import 'package:zapfmaster2k20/core/tapping/tap_service.dart';

class LocalTapService extends TapService {
  LocalTapService() {
    var random = Random();
    for (var i = 1; i < 5; i++) {
      new Timer(
          Duration(seconds: i * 5 + 1), () => tapAmount(random.nextDouble()));
      new Timer(
          Duration(seconds: i * 5 + 2), () => tapAmount(random.nextDouble()));
    }
  }
}
