import 'package:get_it/get_it.dart';
import 'package:zapfmaster2k20/core/services/db.dart';
import 'package:zapfmaster2k20/core/services/user_service.dart';
import 'package:zapfmaster2k20/ui/components/best_list/best_list_view_model.dart';

import 'core/services/navigation_service.dart';

GetIt locator = GetIt.instance;


void setupLocator() {
  locator.registerLazySingleton(() => Db());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory(() => BestListViewModel());
}