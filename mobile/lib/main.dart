import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile/configs/environment.dart';

import 'package:mobile/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  if (Environment.isLocal) {
    await FirebaseAuth.instance
        .useAuthEmulator('localhost', Environment.firebaseEmulatorPort);
  }
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
