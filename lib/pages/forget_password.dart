import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Forget Password?")]));
  }
}
