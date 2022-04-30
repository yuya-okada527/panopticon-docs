import 'package:flutter/material.dart';

Widget textField({
  required String label,
  required Function onChanged,
  bool obscureText = false,
}) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
    obscureText: obscureText,
    autocorrect: false,
    onChanged: (String value) {
      onChanged(value);
    },
  );
}
