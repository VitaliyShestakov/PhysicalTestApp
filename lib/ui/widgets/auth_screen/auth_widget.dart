import 'package:auth_test_app/ui/widgets/auth_screen/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Авторизация',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    const textStyle = TextStyle(fontSize: 16, color: Color(0xFF212529));
    const textFieldDecorator = InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ErrorMessageWidget(),
          const Text(
            'Имя пользователя',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: textFieldDecorator,
            controller: model.loginTextController,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Пароль',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: textFieldDecorator,
            obscureText: true,
            controller: model.passwordTextController,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const _AuthButtonWidget(),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Упс'),
                      content: const Text('Данная фича в разработке, вернитесь позже'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ладно('),
                        )
                      ],
                    ),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(const Color(0xFF01B4E4)),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                child: const Text('Забыли пароль?'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AuthViewModel>();
    return ElevatedButton(
      onPressed: () {
        model.auth(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF01B4E4)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
      ),
      child: const Text('Войти'),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((AuthViewModel m) => m.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 17),
      ),
    );
  }
}
