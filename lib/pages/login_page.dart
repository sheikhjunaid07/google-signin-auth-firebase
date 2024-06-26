import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_signup_auth/authenticate/google_service.dart';
import 'package:login_signup_auth/components/divider.dart';
import 'package:login_signup_auth/components/my_button.dart';
import 'package:login_signup_auth/components/my_text_field.dart';
import 'package:login_signup_auth/components/square_tile.dart';
import 'package:login_signup_auth/pages/forget_password.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // show error message to user as a dialog box
  void showErrorMsg(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: Center(
                  child: Text(message,
                      style: const TextStyle(color: Colors.white))));
        });
  }

  //user sign in method
  void userSignIn() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }));

    //try to login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      //pop the dialog box
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the dialog box
      Navigator.pop(context);
      //show email , password error
      showErrorMsg(e.code);
    }

    //dialog box for wrong email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                MyButton(
                  onTap: userSignIn,
                  text: "Login",
                ),

                const SizedBox(height: 30),

                //or continue with
                const MyDivider(),

                const SizedBox(height: 25),

                //google + apple logo
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //google logo
                  SquareTile(
                    imgPath: "assets/logo/google.png",
                    onTap: () => GoogleService().signInWithGoogle(),
                  ),
                  const SizedBox(width: 26),

                  //apple logo
                  SquareTile(
                      imgPath: "assets/logo/apple.png",
                      onTap: () => GoogleService().signInWithGoogle()),
                ]),

                const SizedBox(height: 60),

                //don't have an account register yourself
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.grey.shade700)),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text("Register Here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    )
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
