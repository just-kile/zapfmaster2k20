import 'package:zapfmaster2k20/core/domain/user.dart';

abstract class Event{}

class UserLoggedIn extends Event{
  User user;

  UserLoggedIn(this.user);
}

class UserLoggedOut extends Event{
  User user;

  UserLoggedOut(this.user);
}

class DraftUpdated extends Event{
  double amount;

  User user;

  DraftUpdated(this.user, this.amount);
}

