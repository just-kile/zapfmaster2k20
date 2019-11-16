import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapfmaster2k20/ui/themes/style.dart';

import 'core/constants/app_contstants.dart';
import 'provider_setup.dart';
import 'ui/router.dart';


void main() => runApp(Zm2kApp());
class Zm2kApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Zapfmastr2k20',
        theme: appTheme(),
        initialRoute: RoutePaths.Overview,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
