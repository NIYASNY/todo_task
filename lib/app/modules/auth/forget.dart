import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/controller/auth_controller.dart';
import 'package:todo_task/app/modules/auth/register.dart';
import 'package:todo_task/app/widgets/constants.dart';
import 'package:todo_task/app/widgets/forgetlogo.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                const Forgetlogo(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), label: Text('Email')),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Enter the email address you used to create your account and",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "We will email you a link to reset your password.",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: authController.isAuthenticating
                          ? PrimaryColor
                          : const Color.fromARGB(255, 67, 20, 237),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: authController.isAuthenticating
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : MaterialButton(
                            onPressed: () async {
                              final email = emailController.text.trim();
                              if (email.isNotEmpty) {
                                await authController.resetPassword(email);
                              } else {
                                Get.snackbar(
                                    'Error', 'Please enter a valid email');
                              }
                            },
                            child: const Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ),
                    ),
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
