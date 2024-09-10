import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/models/task.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  // TaskRepository taskRepository;
  //HomeController({});
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final deleting = false.obs;
  final chipIndex = 0.obs;
  final tasks = <Task>[].obs;
  final task = Rx<Task?>(null);
  final showAllIcons = false.obs;
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;

  // @override
  // void onInit() {
  //   tasks.assignAll(taskRepository.readTasks());

  //   ever(tasks, (_) => taskRepository.writeTasks(tasks));

  //   super.onInit();
  // }

  @override
  void onClose() {
    editController.dispose();
    super.onClose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void changeTodos(List<dynamic> select) {
    doingTodos.clear();
    doneTodos.clear();
    for (int i = 0; i < select.length; i++) {
      var todo = select[i];
      var status = todo['done'];
      if (status == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
  }

  void toggleShowAllIcons() {
    showAllIcons.value = !showAllIcons.value;
  }

  void changeTask(Task? select) {
    task.value = select;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  updateTask(Task task, String title) {
    var todos = task.todos ?? [];
    if (containeTodo(todos, title)) {
      return false;
    }
    var todo = {"title": title, "done": false};
    todos.add(todo);
    var newTask = task.copyWith(todos: todos);
    int oldIdx = tasks.indexOf(task);
    tasks[oldIdx] = newTask;
    tasks.refresh();
    return true;
  }

  bool containeTodo(List todos, String title) {
    return todos.any((element) => element['title'] == title);
  }

  bool addTodo(String title) {
    var todo = {'title': title, 'done': false};
    if (doingTodos
        .any((element) => mapEquals<String, dynamic>(todo, element))) {
      return false;
    }
    var doneTodo = {'title': title, 'done': true};
    if (doneTodos
        .any((element) => mapEquals<String, dynamic>(doneTodo, element))) {
      return false;
    }
    doingTodos.add(todo);
    return true;
  }



  void updateTodos() {
    if (task.value != null) {
      // Add a null check here
      var newTodos = <Map<String, dynamic>>[];  
      newTodos.addAll([
        ...doingTodos,
        ...doneTodos,
      ]);

      var newTask = task.value!.copyWith(todos: newTodos);
      int oldIdx = tasks.indexOf(task.value);
      if (oldIdx != -1) {
        // Ensure the task exists in the list
        tasks[oldIdx] = newTask;
        tasks.refresh();
      }
    } else {
      // Handle the case when task.value is null
      print('task.value is null, cannot update todos');
    }
  }

  void doneTodo(String title) {
    var doingTodo = {"title": title, "done": false};
    int index = doingTodos.indexWhere(
        (element) => mapEquals<String, dynamic>(doingTodo, element));
    doingTodos.removeAt(index);
    var doneTodo = {'title': title, 'done': true};
    doneTodos.add(doneTodo);
    doingTodos.refresh();
    doneTodos.refresh();
  }
}
