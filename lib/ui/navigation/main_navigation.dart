import 'package:flutter/material.dart';
import '../../domain/factoryes/screen_factory.dart';

class MainNavigationRouteNames {
  static const auth = '/';
  static const mainScreen = '/main_screen';
  static const errorScreen = '/error_screen';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMainScreen(),
    MainNavigationRouteNames.errorScreen: (_) => _screenFactory.makeErrorScreen(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text('Навигация полетела, нужно пнуть разработчика');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
