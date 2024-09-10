import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/controller/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final AuthController authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Enter your email'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final email = emailController.text.trim();
                  if (email.isNotEmpty) {
                    authController.resetPassword(email);
                  } else {
                    Get.snackbar('Error', 'Please enter a valid email');
                  }
                },
                child: Text('Send Password Reset Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
