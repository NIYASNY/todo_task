import 'package:get/get.dart';
import 'package:todo_task/app/modules/auth/login.dart';
import 'package:todo_task/app/modules/home/binding/binding.dart';


part 'app_routes.dart';


// class AppPages {
//   AppPages._();

//   static const INITIAL = Routes.HOME;

//   static final routes = [
//     GetPage(
//       name: _Paths.HOME,
//      page: () => const HomePage(),
//       binding: HomeBinding(),
//     ),
//   ];
// }

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const LoginScreen(),  
      binding: HomeBinding(),       
    ),
  ];
}

