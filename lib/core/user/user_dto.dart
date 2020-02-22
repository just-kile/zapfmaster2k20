import 'package:zapfmaster2k20/core/db/database.dart';

class UserDto {
  final int id;
  final String name;
  final String imagePath;
  final String hardwareToken;

  UserDto(this.id, this.name, this.imagePath, this.hardwareToken);

  static UserDto fromUserData(UserData userData) {
    if (userData == null) {
      return null;
    }
    return UserDto(
        userData.id, userData.name, userData.imagePath, userData.hardwareToken);
  }
}
