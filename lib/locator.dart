import 'package:get_it/get_it.dart';

import 'core/bestlist/best_list_service.dart';
import 'core/db/database.dart';
import 'core/navigation/navigation_service.dart';
import 'core/newsfeed/newsfeed_service.dart';
import 'core/tapping/local/local_login_service.dart';
import 'core/tapping/local/local_tap_service.dart';
import 'core/tapping/tapping_event_bus.dart';
import 'core/user/user_repository.dart';
import 'ui/components/best_list/best_list_view_model.dart';
import 'ui/components/newsfeed/news_feed_view_model.dart';
import 'ui/components/settings/settings_view_model.dart';
import 'ui/components/tapping/tappings_view_model.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => Zm2KDb());

  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => TappingEventBus());

  locator.registerLazySingleton(() => UserRepository());

  //Swap here with your prefered login service
  locator.registerSingleton(LocalLoginService());
  locator.registerSingleton(LocalTapService());

  locator.registerLazySingleton(() => BestListService());
  locator.registerLazySingleton(() => NewsFeedService());

  locator.registerFactory(() => BestListViewModel());
  locator.registerFactory(() => NewsFeedViewModel());
  locator.registerFactory(() => TappingViewModel());
  locator.registerFactory(() => SettingsViewModel());
}