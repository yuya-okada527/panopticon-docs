import 'package:flutter/material.dart';

Widget warnMessage(String? message) {
  if (message == null) {
    return const Text("");
  }

  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      message,
      style: const TextStyle(color: Colors.redAccent),
    ),
  );
}
