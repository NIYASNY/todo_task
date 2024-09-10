import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/core/values/colors.dart';
import 'package:todo_task/app/models/task.dart';
import 'package:todo_task/app/controller/controller.dart';
import 'package:todo_task/app/modules/home/widgets/add_card.dart';
import 'package:todo_task/app/modules/home/widgets/add_dialog.dart';
import 'package:todo_task/app/modules/home/widgets/settings.dart';
import 'package:todo_task/app/modules/home/widgets/task_card.dart';
import 'package:todo_task/app/widgets/profilebutton.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: ProfileButton(
              imagePath:
                  'https://media.licdn.com/dms/image/D4E03AQEYFh_cteiGHw/profile-displayphoto-shrink_200_200/0/1675684299451?e=2147483647&v=beta&t=v--ECS2UF_XDYsH7WWSV4IM_IElPKfVgR6Br8umkCxw',
              destinationPage: SettingsPage()),
        ),
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Get.to(SettingsPage());
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 105,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://miro.medium.com/v2/resize:fit:1131/1*LrPlJOQLtWR8Ocr0LmZOQw.jpeg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '"The memories is a shield and life helper"',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Tamim Al-Barghouti',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  AddCard(),
                  ...controller.tasks
                      .map((element) => LongPressDraggable(
                          data: element,
                          onDraggableCanceled: (_, __) =>
                              controller.changeDeleting(false),
                          onDragEnd: (_) => controller.changeDeleting(false),
                          onDragStarted: () => controller.changeDeleting(true),
                          feedback: Opacity(
                            opacity: 0.8,
                            child: TaskCard(task: element),
                          ),
                          child: TaskCard(task: element)))
                      .toList(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_, __, ___) {
          return Obx(() => FloatingActionButton(
                backgroundColor: controller.deleting.value ? Colors.red : blue,
                onPressed: () {
                  if (controller.tasks.isNotEmpty) {
                    Get.to(() => AddDialog(), transition: Transition.downToUp);
                  } else {
                    EasyLoading.showInfo('Please create your task type');
                  }
                },
                child:
                    Icon(controller.deleting.value ? Icons.delete : Icons.add),
              ));
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Delete Success');
        },
      ),
    );
  }
}
