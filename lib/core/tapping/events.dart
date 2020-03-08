import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';

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

  final DrawingDto drawingDto;

  final DateTime createdAt;

  TapFinished(this.user, this.drawingDto, this.createdAt);

}
