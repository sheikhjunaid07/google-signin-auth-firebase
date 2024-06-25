import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(children: [
        Expanded(child: Divider(thickness: 0.9, color: Colors.grey[400])),
        const Text("Or continue with"),
        Expanded(child: Divider(thickness: 0.9, color: Colors.grey[400])),
      ]),
    );
  }
}
