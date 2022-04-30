import 'package:flutter/material.dart';
import 'package:mobile/widgets/common/app_bar.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }
}
