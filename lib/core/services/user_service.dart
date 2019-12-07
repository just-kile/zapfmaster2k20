import 'dart:async';

import 'package:zapfmaster2k20/core/domain/user.dart';

import '../../locator.dart';
import 'db.dart';

class UserService {
  final Db _db = locator<Db>();

  UserService() {
    new Timer(const Duration(seconds: 4), openDraftView);
    new Timer.periodic(const Duration(seconds: 4), timerCb);
  }

  StreamController<List<User>> _userController = StreamController<List<User>>();

  Stream<List<User>> get users => _userController.stream;

  void timerCb(Timer timer) async {
    print('Timer called');
    _userController.add(await _db.getBestList());
  }

  void openDraftView() async {
    print('openDraftView called');
//    Navigator.pop(context);
  }
}
