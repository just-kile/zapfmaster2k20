import 'package:zapfmaster2k20/core/db/domain/best_list_entry.dart';
import 'package:zapfmaster2k20/core/db/domain/user_dto.dart';

class BestListItemDto {
  final UserDto user;
  final double amount;

  BestListItemDto(this.user, this.amount);

  static BestListItemDto fromBestListEntry(BestListEntry entry) {
    return BestListItemDto(entry.user, entry.amount);
  }
}
