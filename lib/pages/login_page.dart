import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_auth/components/divider.dart';
import 'package:login_signup_auth/components/my_button.dart';
import 'package:login_signup_auth/components/my_text_field.dart';
import 'package:login_signup_auth/components/square_tile.dart';
import 'package:login_signup_auth/pages/forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //user sign in method
  void userSignIn() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }));

    //try login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      //pop the dialog box
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the dialog box
      Navigator.pop(context);
      //wrong email
      if (e.code == "user-not-found") {
        wrongEmailMsg();
      } else if (e.code == 'wrong-password') {
        //wrong password
        wrongPasswordMsg();
      }
    }
  }

  //dialog box for wrong email
  void wrongEmailMsg() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Incorrect Email!!"));
        });
  }

  //dialog box for wrong password
  void wrongPasswordMsg() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Incorrect Password!!"));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 24),
                //logo
                const Icon(Icons.lock, size: 100),

                const SizedBox(height: 30),

                //welcome msg
                Text("Welcome Back you've been missed",
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 16)),

                const SizedBox(height: 30),

                //email field
                MyTextField(
                    obsecureText: false,
                    controller: emailController,
                    labelText: "Email"),

                const SizedBox(height: 15),

                //password field
                MyTextField(
                    obsecureText: true,
                    controller: passwordController,
                    labelText: "Password"),

                const SizedBox(height: 8),

                //forget password
                const ForgetPassword(),

                const SizedBox(height: 20),

                //login button
                MyButton(onTap: userSignIn),

                const SizedBox(height: 30),

                //or continue with
                const MyDivider(),

                const SizedBox(height: 25),

                //google + apple logo
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //google logo
                      SquareTile(imgPath: "assets/logo/google.png"),
                      SizedBox(width: 26),

                      //apple logo
                      SquareTile(imgPath: "assets/logo/apple.png"),
                    ]),

                const SizedBox(height: 80),

                //don't have an account register yourself
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.grey.shade700)),
                    const SizedBox(width: 5),
                    const Text("Register Here",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
