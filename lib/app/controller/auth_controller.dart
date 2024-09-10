import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/modules/auth/login.dart';
import 'package:todo_task/app/modules/home/view.dart';
import 'package:todo_task/app/widgets/constants.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final Rx<User?> _user = Rx<User?>(firebaseAuth.currentUser);
  User? get user => _user.value;
  final Rx<bool> _isAuthenticating = Rx<bool>(false);
  bool get isAuthenticating => _isAuthenticating.value;

  @override
  void onReady() {
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, onAuthStateChanged);
    super.onReady();
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _isAuthenticating.value = true;
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      _isAuthenticating.value = false;
      return true;
    } catch (e) {
      _isAuthenticating.value = false;
      print('$e');
      return false;
    }
  }

  Future<bool> register(String fullName, String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      print('Passwords do not match');
      return false;
    }
    try {
      _isAuthenticating.value = true;
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firebaseAuth.currentUser?.updateProfile(displayName: fullName);

      _isAuthenticating.value = false;
      return true;
    } catch (e) {
      _isAuthenticating.value = false;
      print('$e');
      return false;
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  onAuthStateChanged(User? userx) {
    if (userx == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() =>  HomePage());
    }
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todo_task/app/models/usermodel.dart';
// import 'package:todo_task/app/modules/home/view.dart';

// class AuthController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   TextEditingController username = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();
//   TextEditingController loginemail = TextEditingController();
//   TextEditingController loginpassword = TextEditingController();
//   TextEditingController resetpassword = TextEditingController();
//   var loading = false.obs;

//   singup() async {
//     try {
//       loading.value = true;
//       await auth.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);
//       await addUser();
//       await verifyEmail();
//       Get.to(HomePage());
//       loading.value = false;
//     } catch (e) {
//       Get.snackbar("error", "$e");
//       loading.value = false;
//     }
//   }

//   addUser() async {
//     UserModel user = UserModel(
//       username: username.text,
//       email: auth.currentUser?.email,
//     );
//     await db
//         .collection('Users')
//         .doc(auth.currentUser?.uid)
//         .collection("profile")
//         .add(user.toMap());
//   }

//   signout() async {
//     await auth.signOut();
//   }

//   signin() async {
//     try {
//       await auth.signInWithEmailAndPassword(
//           email: loginemail.text, password: loginpassword.text);
//     } catch (e) {
//       Get.snackbar("error", "$e");
//     }
//   }

//   verifyEmail() async {
//     await auth.currentUser?.sendEmailVerification();
//     Get.snackbar('email', 'send');
//   }
// }
