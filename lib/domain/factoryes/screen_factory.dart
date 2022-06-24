import 'package:auth_test_app/ui/widgets/auth_screen/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../ui/widgets/auth_screen/auth_widget.dart';
import '../../ui/widgets/error_screen/error_screen.dart';
import '../../ui/widgets/main_screen/main_screen.dart';

class ScreenFactory {
  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    return const MainScreenWidget();
  }

  Widget makeErrorScreen() {
    return const ErrorScreenWidget();
  }
}
