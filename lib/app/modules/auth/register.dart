// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todo_task/app/modules/auth/login.dart';
// import 'package:todo_task/app/widgets/constants.dart';
// import 'package:todo_task/app/widgets/registerlogo.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final formKey = GlobalKey<FormState>();
//   final fullNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     fullNameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 const RegisterLogo(),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: fullNameController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Full name is required';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text('Full Name'),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: emailController,
//                     validator: (value) {
//                       if (!regExForEmail.hasMatch(value!)) {
//                         return 'Please enter valid email';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text('Email'),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: passwordController,
//                     obscureText: true,
//                     validator: (value) {
//                       if (value!.length < 8) {
//                         return 'Minimum 8 characters required';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text('Password'),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: true,
//                     validator: (value) {
//                       if (value != passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text('Confirm Password'),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Obx(() {
//                   return Container(
//                     width: double.infinity,
//                     height: 60,
//                     margin: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       color: authcontroller.isAuthenticating
//                           ? PrimaryColor
//                           : const Color.fromARGB(255, 67, 20, 237),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: authcontroller.isAuthenticating
//                         ? const Center(child: CircularProgressIndicator())
//                         : MaterialButton(
//                             onPressed: () async {
//                               FocusManager.instance.primaryFocus?.unfocus();
//                               if (formKey.currentState!.validate()) {
//                                 final result = await authcontroller.register(
//                                     fullNameController.text,
//                                     emailController.text,
//                                     passwordController.text,
//                                     confirmPasswordController.text);
//                                 if (!result) {
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(const SnackBar(
//                                     content: Text(
//                                         'Something went wrong or password mismatch'),
//                                     backgroundColor: Colors.red,
//                                   ));
//                                 }
//                               }
//                             },
//                             child: const Text(
//                               'Register',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 20),
//                             ),
//                           ),
//                   );
//                 }),
//                 const SizedBox(height: 13),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Already have an account?'),
//                     TextButton(
//                         onPressed: () {
//                           Get.off(() => const LoginScreen());
//                         },
//                         child: const Text(
//                           'Login Now',
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                               decoration: TextDecoration.underline),
//                         )),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/modules/auth/login.dart';
import 'package:todo_task/app/widgets/constants.dart';
import 'package:todo_task/app/widgets/registerlogo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const RegisterLogo(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fullNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Full Name'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                        return 'Please enter a valid email';
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
                    controller: passwordController,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Confirm Password'),
                    ),
                  ),
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
                                final result = await authcontroller.register(
                                    fullNameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    confirmPasswordController.text);
                                if (!result) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        'Something went wrong or password mismatch'),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              }
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                  );
                }),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Get.off(() => const LoginScreen());
                        },
                        child: const Text(
                          'Login Now',
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
