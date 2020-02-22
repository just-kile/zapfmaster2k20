import 'package:zapfmaster2k20/core/tapping/events.dart';

class DrawingDto {
  final int id;
  final int userId;
  final double amount;
  final DateTime createdAt;

  DrawingDto(this.id, this.userId, this.amount, this.createdAt);

  static DrawingDto fromTapFinished(TapFinished event) {
    return DrawingDto(null, event.user.id, event.amount, event.createdAt);
  }
}
