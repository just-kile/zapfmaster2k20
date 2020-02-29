import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';

abstract class NewsItem {}

class UserTapped extends NewsItem {
  final UserDto user;
  final double amount;

  UserTapped(this.user, this.amount);
}

class ReachedAchievement extends NewsItem {}
