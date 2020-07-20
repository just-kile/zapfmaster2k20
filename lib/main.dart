import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zapfmaster2k20/ui/themes/style.dart';

import 'core/constants/app_contstants.dart';
import 'core/navigation/navigation_service.dart';
import 'locator.dart';
import 'main.reflectable.dart';
import 'ui/router.dart';

void main()  {
  initializeReflectable();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(Zm2kApp());
}

class Zm2kApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zapfmastr2k20',
      theme: appTheme(),
      initialRoute: RoutePaths.Overview,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
