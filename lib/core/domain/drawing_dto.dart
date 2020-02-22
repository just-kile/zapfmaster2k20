import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';

class DrawingDto {
  final int id;
  final int userId;
  final double amount;
  final DateTime createdAt;

  DrawingDto(this.id, this.userId, this.amount, this.createdAt);

  static DrawingDto fromDrawingData(DrawingData drawingData) {
    return DrawingDto(drawingData.id, drawingData.userId, drawingData.amount,
        drawingData.createdAt);
  }

  static DrawingDto fromTapFinished(TapFinished event) {
//    return null;
    return DrawingDto(null, event?.user?.id, event.amount, event.createdAt);
  }
}
