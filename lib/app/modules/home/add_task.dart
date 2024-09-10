// // import 'package:flutter/material.dart';
// // import 'package:flutter_easyloading/flutter_easyloading.dart';
// // import 'package:get/get.dart';
// // import 'package:todo_task/app/controller/controller.dart';
// // import 'package:todo_task/app/models/task.dart';

// // class TaskDetailPage extends StatelessWidget {
// //   final Task task;
// //   final HomeController homeCtrl = Get.find<HomeController>();

// //   TaskDetailPage({super.key, required this.task});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(task.title),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Obx(() {
// //               // Display list of tasks related to this category
// //               var taskItems = homeCtrl.getTasksByCategory(task.title);

// //               // Check if there are tasks to display
// //               if (taskItems.isEmpty) {
// //                 return Center(
// //                   child: Text(
// //                     'No tasks available for ${task.title}',
// //                     style: TextStyle(color: Colors.grey),
// //                   ),
// //                 );
// //               }

// //               return ListView.builder(
// //                 itemCount: taskItems.length,
// //                 itemBuilder: (context, index) {
// //                   var taskItem = taskItems[index];
// //                   return ListTile(
// //                     title: Text(taskItem.title),
// //                     trailing: IconButton(
// //                       icon: Icon(Icons.delete, color: Colors.red),
// //                       onPressed: () {
// //                         homeCtrl.deleteTask(taskItem);
// //                         EasyLoading.showSuccess('Task Deleted');
// //                       },
// //                     ),
// //                   );
// //                 },
// //               );
// //             }),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: ElevatedButton(
// //               onPressed: () {
// //                 // Show Add Task Dialog
// //                 Get.defaultDialog(
// //                   title: 'Add Task to ${task.title}',
// //                   content: Form(
// //                     key: homeCtrl.formKey, // Linking the formKey
// //                     child: Column(
// //                       children: [
// //                         TextFormField(
// //                           controller: homeCtrl.editController,
// //                           decoration: const InputDecoration(
// //                             border: OutlineInputBorder(),
// //                             labelText: 'Task Name',
// //                           ),
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Please enter a task name';
// //                             }
// //                             return null;
// //                           },
// //                         ),
// //                         const SizedBox(height: 10), // Add some space
// //                         ElevatedButton(
// //                           onPressed: () {
// //                             // Validate the form
// //                             if (homeCtrl.formKey.currentState!.validate()) {
// //                               // Create a new task
// //                               var newTask = Task(
// //                                 title: homeCtrl.editController.text,
// //                                 icon: task.icon,
// //                                 color: task.color,
// //                               );
// //                               // Add task to controller
// //                               bool success = homeCtrl.addTask(newTask);

// //                               // Check if task was added successfully
// //                               if (success) {
// //                                 // Clear input field
// //                                 homeCtrl.editController.clear();
// //                                 // Close dialog and show success message
// //                                 Get.back();
// //                                 EasyLoading.showSuccess('Task Added');
// //                               } else {
// //                                 // Show error if task already exists
// //                                 EasyLoading.showError('Task already exists');
// //                               }
// //                             }
// //                           },
// //                           child: const Text('Add Task'),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //               child: const Text('Add Task'),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:todo_task/app/controller/controller.dart';
// import 'package:todo_task/app/models/task.dart';

// class TaskDetailPage extends StatelessWidget {
//   final Task task; // The category task (like "Sports")
//   final HomeController homeCtrl = Get.find<HomeController>();

//   TaskDetailPage({super.key, required this.task});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${task.title} Tasks'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Task List Section
//           Expanded(
//             child: Obx(() {
//               // Get tasks related to this category
//               var taskItems = homeCtrl.getTasksByCategory(task.title);

//               // Check if there are tasks
//               if (taskItems.isEmpty) {
//                 return Center(
//                   child: Text(
//                     'No tasks available for ${task.title}',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 );
//               }

//               return ListView.builder(
//                 itemCount: taskItems.length,
//                 itemBuilder: (context, index) {
//                   var taskItem = taskItems[index];
//                   return ListTile(
//                     title: Text(taskItem.title),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: () {
//                         homeCtrl.deleteTask(taskItem);
//                         EasyLoading.showSuccess('Task Deleted');
//                       },
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),

//           // Add Task Button Section
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Show Add Task Dialog
//                 Get.defaultDialog(
//                   title: 'Add Task to ${task.title}',
//                   content: Form(
//                     key: homeCtrl.formKey, // Link the formKey
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: homeCtrl.editController,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Task Name',
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a task name';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 10), // Add some space
//                         ElevatedButton(
//                           onPressed: () {
//                             // Validate the form
//                             if (homeCtrl.formKey.currentState!.validate()) {
//                               // Create a new task related to the selected category
//                               var newTask = Task(
//                                 title: homeCtrl.editController.text,
//                                 icon: task.icon, // Use the category's icon
//                                 color: task.color, // Use the category's color
//                                 // category: task.title, // Set category for task
//                               );

//                               // Add task to controller
//                               bool success = homeCtrl.addTask(newTask);

//                               // Check if task was added successfully
//                               if (success) {
//                                 // Clear input field
//                                 homeCtrl.editController.clear();
//                                 // Show success message
//                                 EasyLoading.showSuccess('Task Added');
//                               } else {
//                                 // Show error if task already exists
//                                 EasyLoading.showError('Task already exists');
//                               }
//                             }
//                           },
//                           child: const Text('Add Task'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('Add Task'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

