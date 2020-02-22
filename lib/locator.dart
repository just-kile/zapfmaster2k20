import 'package:get_it/get_it.dart';
import 'package:zapfmaster2k20/core/bestlist/best_list_service.dart';
import 'package:zapfmaster2k20/core/newsfeed/newsfeed_service.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';
import 'package:zapfmaster2k20/ui/components/newsfeed/news_feed_view_model.dart';

import 'core/bestlist/best_list_repository.dart';
import 'core/db/database.dart';
import 'core/newsfeed/newsfeed_repository.dart';
import 'core/navigation/navigation_service.dart';
import 'core/tapping/login_service.dart';
import 'core/tapping/tap_service.dart';
import 'core/tapping/tapping_event_bus.dart';
import 'core/user/user_repository.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => Zm2KDb());

  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => TappingEventBus());

  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => BestListRepository());
  locator.registerFactory(() => NewsfeedRepository());

  locator.registerLazySingleton(() => BestListService());
  locator.registerSingleton(LoginService());
  locator.registerSingleton(TapService());
  locator.registerFactory(() => NewsFeedService());

  locator.registerFactory(() => BestListViewModel());


  locator.registerFactory(() => NewsFeedViewModel());
}