import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  void userSignOut() {
    FirebaseAuth.instance.signOut();
  }

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: userSignOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Login Email is: ${user.email!}"),
      ),
    );
  }
}
