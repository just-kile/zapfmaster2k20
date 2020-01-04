import 'package:get_it/get_it.dart';
import 'package:zapfmaster2k20/core/bestlist/best_list_service.dart';
import 'package:zapfmaster2k20/core/newsfeed/newsfeed_service.dart';
import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';

import 'core/bestlist/best_list_repository.dart';
import 'core/newsfeed/newsfeed_repository.dart';
import 'core/services/navigation_service.dart';
import 'core/tapping/login_service.dart';
import 'core/tapping/tap_service.dart';
import 'core/tapping/tapping_event_bus.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => Db());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => TappingEventBus());
  locator.registerSingleton(LoginService());
  locator.registerSingleton(TapService());

  locator.registerLazySingleton(() => BestListRepository());
  locator.registerLazySingleton(() => BestListService());

  locator.registerFactory(() => BestListViewModel());

  locator.registerFactory(() => NewsfeedRepository());
  locator.registerFactory(() => NewsFeedService());
  locator.registerFactory(() => NewsFeedViewModel());
}