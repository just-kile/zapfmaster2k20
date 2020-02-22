import 'package:zapfmaster2k20/core/db/daos/best_list_dao.dart';
import 'package:zapfmaster2k20/core/user/user_dto.dart';

class BestListItemDto {
  final UserDto user;
  final double amount;

  BestListItemDto(this.user, this.amount);

  static BestListItemDto fromBestListEntry(BestListEntry entry) {
    return BestListItemDto(
        UserDto.fromUserData(entry.user), entry.amount);
  }
}
