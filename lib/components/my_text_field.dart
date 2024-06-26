import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool obsecureText;
  final controller;
  final String labelText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.obsecureText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextField(
            obscureText: obsecureText,
            controller: controller,
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[500]),
                labelText: labelText,
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                fillColor: Colors.grey.shade200,
                filled: true)));
  }
}
