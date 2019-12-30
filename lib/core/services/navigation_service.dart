import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  bool pop() {
    if(navigatorKey.currentState.canPop()){
      return navigatorKey.currentState.pop();
    }
    return false;

  }
}
