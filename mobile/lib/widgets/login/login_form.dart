import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/pages/projects_page.dart';
import 'package:mobile/widgets/login/submit_button.dart';
import 'package:mobile/widgets/login/text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _mailAddress = "";
  String _password = "";
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textField(
            label: "メールアドレス",
            onChanged: (String value) {
              setState(() {
                _mailAddress = value;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          textField(
            label: "パスワード",
            onChanged: (String value) {
              setState(() {
                _password = value;
              });
            },
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
                  email: _mailAddress,
                  password: _password,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const ProjectsPage();
                  })
                );
              } catch (e) {
                // TODO implemets
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
