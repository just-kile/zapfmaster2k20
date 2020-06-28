import 'dart:async';

import 'package:zapfmaster2k20/core/tapping/tap_service.dart';

class LocalTapService extends TapService {
  LocalTapService() {
    new Timer(const Duration(seconds: 5 + 1), () => tapAmount(0.1));
    new Timer(const Duration(seconds: 5 + 2), () => tapAmount(0.2));
    new Timer(const Duration(seconds: 5 + 3), () => tapAmount(0.3));
    new Timer(const Duration(seconds: 5 + 4), () => tapAmount(0.4));
    new Timer(const Duration(seconds: 5 + 5), () => tapAmount(0.5));
    new Timer(const Duration(seconds: 5 + 6), () => tapAmount(0.6));
  }
}
