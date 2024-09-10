import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/core/utils/extension.dart';
import 'package:todo_task/app/models/task.dart';
import 'package:todo_task/app/controller/controller.dart';
import 'package:todo_task/app/modules/detail/view.dart';

class TaskCard extends StatelessWidget {
  final homectrl = Get.find<HomeController>();
  final Task task;
  TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    final color = HexColor.fromHex(task.color);
    var squareWidth = MediaQuery.of(context).size.width - 12.0.wp;

    return GestureDetector(
      onTap: () {
        homectrl.changeTask(task);
        homectrl.changeTodos(task.todos ?? []);
        Get.to(() => DetailPage());
      },
      child: Container(
        width: squareWidth / 2,
        height: squareWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface, 
          boxShadow: [
            BoxShadow(
              color: theme.brightness == Brightness.light
                  ? Colors.grey[300]!
                  : Colors.black26, 
              blurRadius: 7,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(6.0.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                IconData(
                  task.icon,
                  fontFamily: 'MaterialIcons',
                ),
                color: color,
                size: 10.0.wp, // Responsive icon size
              ),
              SizedBox(height: 3.0.wp),
              Flexible(
                child: Text(
                  task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0.sp, // Responsive font size
                    color: theme.colorScheme.onSurface, // Adapt text color
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 2.0.wp),
              Text(
                '${task.todos?.length ?? 0}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface
                      .withOpacity(0.6), // Adjust text color for theme
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
