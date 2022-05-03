import 'package:flutter/material.dart';

Widget textField({
  required TextEditingController controller,
  required String label,
  bool obscureText = false,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
    obscureText: obscureText,
    autocorrect: false,
    controller: controller,
  );
}
