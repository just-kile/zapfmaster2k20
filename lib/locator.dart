import 'package:get_it/get_it.dart';
import 'package:zapfmaster2k20/core/achievements/achievement_service.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/new_keg_page_view_model.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/new_user_page_view_model.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/revert_draft_page_view_model.dart';
import 'package:zapfmaster2k20/ui/components/settings/pages/select_user_page_view_model.dart';

import 'core/bestlist/best_list_service.dart';
import 'core/db/database.dart';
import 'core/navigation/navigation_service.dart';
import 'core/newsfeed/newsfeed_service.dart';
import 'core/refresh_event_bus.dart';
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
  locator.registerLazySingleton(() => RefreshEventBus());

  locator.registerLazySingleton(() => UserRepository());

  //Swap here with your prefered login service
  locator.registerSingleton(LocalLoginService());
  locator.registerSingleton(LocalTapService());
  locator.registerSingleton(AchievementService());

  locator.registerLazySingleton(() => BestListService());
  locator.registerLazySingleton(() => NewsFeedService());

  locator.registerFactory(() => BestListViewModel());
  locator.registerFactory(() => NewsFeedViewModel());
  locator.registerFactory(() => TappingViewModel());
  locator.registerFactory(() => SettingsViewModel());
  locator.registerFactory(() => RevertDraftPageViewModel());
  locator.registerFactory(() => NewKegPageViewModel());
  locator.registerFactory(() => NewUserPageViewModel());
  locator.registerFactory(() => SelectUserPageViewModel());
}