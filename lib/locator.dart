import 'package:get_it/get_it.dart';
import 'package:zapfmaster2k20/core/bestlist/best_list_service.dart';
import 'package:zapfmaster2k20/core/draft_measuring/login_service.dart';
import 'package:zapfmaster2k20/core/draft_measuring/user_event_bus.dart';
import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';

import 'core/draft_measuring/tap_service.dart';
import 'core/services/navigation_service.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => Db());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => UserEventBus());
  locator.registerSingleton(LoginService());
  locator.registerSingleton(TapService());

  locator.registerLazySingleton(() => BestListService());
  locator.registerFactory(() => BestListViewModel());
}