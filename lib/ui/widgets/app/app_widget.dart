import 'package:flutter/material.dart';

import '../../navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuthTestApp',
      debugShowCheckedModeBanner: false,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.auth,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
