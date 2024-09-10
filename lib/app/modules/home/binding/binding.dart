import 'package:get/get.dart';
import 'package:todo_task/app/models/providers/providers.dart';
import 'package:todo_task/app/models/services/repository.dart';
import 'package:todo_task/app/controller/controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
      ),
    );
  }
}
// taskRepository: TaskRepository(taskProvider: TaskProvider(),