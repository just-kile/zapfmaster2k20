import 'package:zapfmaster2k20/core/db/domain/drawing_dto.dart';

typedef AchievementPredicate = bool Function(
    DrawingDto currentDrawing, List<DrawingDto> recentDrawings);

class AchievementDefinition {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  final AchievementPredicate predicate;

  AchievementDefinition(
      this.id, this.title, this.description, this.imagePath, this.predicate);
}

class AchievementDefinitions {
  static List<AchievementDefinition> achievements = [
    new AchievementDefinition(1, "Moe", "Ein Bier getrunken", "",
        (currentDrawing, List<DrawingDto> recentDrawings) {
      return recentDrawings.fold(0, (acc, drawing) => acc + drawing.amount) >=
          0.5;
    }),
    new AchievementDefinition(2, "Carl", "3 Bier getrunken", "",
        (currentDrawing, List<DrawingDto> recentDrawings) {
      return recentDrawings.fold(0, (acc, drawing) => acc + drawing.amount) >=
          1.5;
    })
  ];
}
