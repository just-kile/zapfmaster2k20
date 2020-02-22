import 'package:zapfmaster2k20/core/domain/user.dart';

abstract class Event{}

class UserLoggedIn extends Event{
  UserDto user;

  UserLoggedIn(this.user);
}

class UserLoggedOut extends Event{
  UserDto user;

  UserLoggedOut(this.user);
}

class TapAmountUpdated extends Event{
  UserDto user;

  double amount;

  TapAmountUpdated(this.user, this.amount);
}

class TapFinished extends Event{
  final UserDto user;

  final double amount;

  final DateTime createdAt;

  TapFinished(this.user, this.amount, this.createdAt);
}
