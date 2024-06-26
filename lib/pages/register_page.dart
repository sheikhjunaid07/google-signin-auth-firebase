import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup_auth/authenticate/google_service.dart';
import 'package:login_signup_auth/components/divider.dart';
import 'package:login_signup_auth/components/my_button.dart';
import 'package:login_signup_auth/components/my_text_field.dart';
import 'package:login_signup_auth/components/square_tile.dart';
import 'package:login_signup_auth/pages/forget_password.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // show error messege to user as a dialog box
  void showErrorMsg(String messege) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.blueGrey,
              title: Center(
                  child: Text(messege,
                      style: const TextStyle(color: Colors.white))));
        });
  }

  //user sign up method
  void userSignUp() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }));

    //try to signup
    try {
      // check the confirm password is same as password
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        showErrorMsg("Password won't be same!!!");
      }

      //pop the dialog box
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the dialog box
      Navigator.pop(context);
      //show email , password error
      showErrorMsg(e.code);
    }
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

                const SizedBox(height: 25),

                //welcome msg
                Text("Create an account to Join us",
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

                const SizedBox(height: 15),

                //confirm password field
                MyTextField(
                    obsecureText: true,
                    controller: confirmPasswordController,
                    labelText: "Confirm Password"),

                const SizedBox(height: 8),

                //forget password
                const ForgetPassword(),

                const SizedBox(height: 20),

                //login button
                MyButton(onTap: userSignUp, text: "Sign Up"),

                const SizedBox(height: 30),

                //or continue with with divider
                const MyDivider(),

                const SizedBox(height: 25),

                //google + apple logo
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //google logo
                  SquareTile(
                      imgPath: "assets/logo/google.png",
                      onTap: () => GoogleService().signInWithGoogle()),
                  SizedBox(width: 26),

                  //apple logo
                  SquareTile(imgPath: "assets/logo/apple.png", onTap: () {}),
                ]),

                const SizedBox(height: 40),

                //Already have an account login here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(color: Colors.grey.shade700)),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text("Login Here",
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
