import 'package:flutter/material.dart';
import 'package:mobile/pages/login_page.dart';

void main() {
  runApp(const PanopticonApp());
}

class PanopticonApp extends StatelessWidget {
  const PanopticonApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panopticon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
