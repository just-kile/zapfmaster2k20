import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zapfmaster2k20/core/constants/app_contstants.dart';
import 'package:zapfmaster2k20/ui/screens/details.dart';

import 'screens/overview.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Overview:
        return MaterialPageRoute(builder: (_) => Overview());
      case RoutePaths.Details:
        return MaterialPageRoute(builder: (_) => Details());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
