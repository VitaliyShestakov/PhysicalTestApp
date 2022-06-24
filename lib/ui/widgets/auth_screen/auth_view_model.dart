import 'package:auth_test_app/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isValid(String login, String password) => login.isEmpty || password.isEmpty;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (_isValid(login, password)) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }

    if (login == 'физикл' && password == 'физикл') {
      Navigator.pushReplacementNamed(context, MainNavigationRouteNames.mainScreen);
    } else {
      Navigator.pushNamed(context, MainNavigationRouteNames.errorScreen);
    }
  }
}
