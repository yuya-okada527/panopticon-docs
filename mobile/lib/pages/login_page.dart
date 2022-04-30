import 'package:flutter/material.dart';
import 'package:mobile/widgets/common/app_bar.dart';
import 'package:mobile/widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}
