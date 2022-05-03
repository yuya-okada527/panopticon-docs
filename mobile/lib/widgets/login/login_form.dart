import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile/pages/projects_page.dart';
import 'package:mobile/widgets/login/submit_button.dart';
import 'package:mobile/widgets/login/text_field.dart';
import 'package:mobile/widgets/login/warn_message.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailAddreeeController = TextEditingController(
    text: "",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "",
  );
  String? _message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textField(
            label: "メールアドレス",
            controller: _emailAddreeeController,
          ),
          const SizedBox(
            height: 24,
          ),
          textField(
            label: "パスワード",
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(
            height: 24,
          ),
          loginButton(
            onPressed: () async {
              try {
                final FirebaseAuth auth = FirebaseAuth.instance;
                UserCredential result = await auth.signInWithEmailAndPassword(
                  email: _emailAddreeeController.text,
                  password: _passwordController.text,
                );
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProjectsPage();
                }));
                setState(() {
                  _message = null;
                });
              } on FirebaseAuthException catch (e) {
                setState(() {
                  _message = e.message;
                });
              }
            },
          ),
          warnMessage(_message),
        ],
      ),
    );
  }
}
