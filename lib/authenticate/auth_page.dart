import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_auth/pages/home_page.dart';
import 'package:login_signup_auth/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //StreamBuilder has the list of users
        body: StreamBuilder<User?>(
            //checked the user logged in or not
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // user logged in
                return HomePage();
              } else {
                //user is NOT logged in
                return const LoginOrRegisterPage();
              }
            }));
  }
}
