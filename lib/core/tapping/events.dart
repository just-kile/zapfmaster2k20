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

class TapAmountUpdated extends Event{
  User user;

  double amount;

  TapAmountUpdated(this.user, this.amount);
}

class TapFinished extends Event{
  User user;

  double amount;

  TapFinished(this.user, this.amount);
}

class BestlistUpdated extends Event{
  List<User> bestlist;

  BestlistUpdated(this.bestlist);
}

