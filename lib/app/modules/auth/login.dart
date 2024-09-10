import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/modules/auth/forget.dart';
import 'package:todo_task/app/modules/auth/register.dart';
import 'package:todo_task/app/widgets/constants.dart';
import 'package:todo_task/app/widgets/loginlogo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const TodoLogo(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!regExForEmail.hasMatch(value!)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Email'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Minimum 8 characters required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.to(ForgotPasswordScreen());
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                const SizedBox(height: 15),
                Obx(() {
                  return Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: authcontroller.isAuthenticating
                          ? PrimaryColor
                          : const Color.fromARGB(255, 67, 20, 237),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: authcontroller.isAuthenticating
                        ? const Center(child: CircularProgressIndicator())
                        : MaterialButton(
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (formKey.currentState!.validate()) {
                                final result = await authcontroller.signIn(
                                    emailController.text, passController.text);
                                if (!result) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Something went wrong'),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              }
                            },
                            child: const Text(
                              'Continue',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                  );
                }),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                        onPressed: () {
                          Get.off(() => const RegisterScreen());
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              decoration: TextDecoration.underline),
                        )),
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
