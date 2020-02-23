import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';

class BestListEntry {
  BestListEntry(this.user, this.amount);

  final UserDto user;
  final double amount;
}
