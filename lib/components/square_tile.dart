import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imgPath;
  const SquareTile({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: Image.asset(imgPath, height: 30));
  }
}
