import 'package:zapfmaster2k20/core/achievements/achievement_definitions.dart';

import '../database.dart';

class AchievementDto {
  final int id;
  final String title;
  final String description;
  final String imagePath;

  AchievementDto(this.id, this.title, this.description, this.imagePath);

  static AchievementDto from(AchievementCompanion achievementCompanion) {
    if (achievementCompanion == null) {
      return null;
    }
    return AchievementDto(
        achievementCompanion.id.value,
        achievementCompanion.title.value,
        achievementCompanion.description.value,
        achievementCompanion.imagePath.value);
  }

  static AchievementDto fromAchievementData(AchievementData achievementData) {
    if (achievementData == null) {
      return null;
    }
    return AchievementDto(achievementData.id, achievementData.title,
        achievementData.description, achievementData.imagePath);
  }

  static AchievementDto fromAchievementDefinition(
      AchievementDefinition definition) {
    if (definition == null) {
      return null;
    }

    return AchievementDto(definition.id, definition.title,
        definition.description, definition.imagePath);
  }
}
