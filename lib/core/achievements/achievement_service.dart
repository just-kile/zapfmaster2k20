import 'package:zapfmaster2k20/core/achievements/achievement_definitions.dart';
import 'package:zapfmaster2k20/core/db/database.dart';
import 'package:zapfmaster2k20/core/db/domain/achievement_dto.dart';
import 'package:zapfmaster2k20/core/tapping/events.dart';
import 'package:zapfmaster2k20/core/tapping/tapping_event_bus.dart';
import 'package:zapfmaster2k20/logger.dart';

import '../../locator.dart';

class AchievementService {
  final Zm2KDb _db = locator<Zm2KDb>();

  final TappingEventBus _bus = locator<TappingEventBus>();

  AchievementService() {
    _bus.on<TapFinished>().listen(checkAchievements);
  }

  Future<void> checkAchievements(TapFinished event) async {
    logger.i("Check Achievements for user ${event.user.name}");
    var drawings = await _db.drawingDao.getDrawingsForUser(event.user.id);
    var alreadyReachedAchievements = await _db.newsDao.getAchievementListForUser(event.user.id);
    Iterable<AchievementDefinition> reachedAchievements = AchievementDefinitions
        .achievements.where(
            (definition) => definition.predicate(event.drawingDto, drawings));


    reachedAchievements.forEach((definition) {
      logger.i("Achievement reached!${event.user.name} reached ${definition.title}");
      _bus.fire(AchievementReached(event.user, AchievementDto.fromAchievementDefinition(definition), DateTime.now()));
    });
//    _bus.fire(new AchievementReached(event.user, null, DateTime.now()));
  }
}
