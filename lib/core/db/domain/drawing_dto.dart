import '../database.dart';

class DrawingDto {
  final int id;
  final int userId;
  final double amount;
  final DateTime createdAt;

  DrawingDto(this.id, this.userId, this.amount, this.createdAt);

  static DrawingDto from(DrawingCompanion drawingData) {
    if (drawingData == null) {
      return null;
    }
    return DrawingDto(drawingData.id.value, drawingData.userId.value,
        drawingData.amount.value, drawingData.createdAt.value);
  }
  static DrawingDto fromDrawingData(DrawingData drawingData) {
    if (drawingData == null) {
      return null;
    }
    return DrawingDto(drawingData.id, drawingData.userId,
        drawingData.amount, drawingData.createdAt);
  }
}
