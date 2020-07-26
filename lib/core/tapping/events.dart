import 'package:zapfmaster2k20/core/db/domain/achievement_dto.dart';
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
class AchievementReached extends Event{
  final UserDto user;

  final AchievementDto achievement;

  final DateTime createdAt;

  AchievementReached(this.user, this.achievement, this.createdAt);
}

class UnknownLoginDeviceRecognized extends Event{
  final String hardwareToken;

  UnknownLoginDeviceRecognized(this.hardwareToken);

}
