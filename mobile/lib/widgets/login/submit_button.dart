import 'package:flutter/material.dart';

Widget loginButton({required Function onPressed}) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: const Text("ログイン"),
    ),
  );
}
