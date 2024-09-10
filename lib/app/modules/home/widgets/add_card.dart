import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/core/utils/extension.dart';
import 'package:todo_task/app/models/task.dart';
import 'package:todo_task/app/controller/controller.dart';
import 'package:todo_task/app/modules/home/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homectrl = Get.find<HomeController>();
  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = MediaQuery.of(context).size.width - 5.0.wp;

    return Container(
      width: squareWidth / 4,
      height: squareWidth / 4,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            radius: 5,
            contentPadding: EdgeInsets.zero, // Remove padding around content
            title: '', // Title text without additional decoration
            content: SingleChildScrollView(
              child: Form(
                key: homectrl.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Obx(() {
                        // Determine how many icons to display (one or all)
                        final displayedIcons = homectrl.showAllIcons.value
                            ? icons
                            : [icons[homectrl.chipIndex.value]];

                        return Column(
                          children: [
                            // Display the icons as ChoiceChips
                            Wrap(
                              spacing: 2.0.wp,
                              children: displayedIcons.map((e) {
                                final index = icons.indexOf(e);
                                return ChoiceChip(
                                  selectedColor: Colors.grey[200],
                                  pressElevation: 0,
                                  backgroundColor: Colors.white,
                                  label: e,
                                  selected: homectrl.chipIndex.value == index,
                                  onSelected: (bool selected) {
                                    homectrl.chipIndex.value =
                                        selected ? index : 0;
                                  },
                                );
                              }).toList(),
                            ),

                            // IconButton to show/hide all icons
                            IconButton(
                              onPressed: homectrl.toggleShowAllIcons,
                              icon: Icon(
                                homectrl.showAllIcons.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    // Task Title Input Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                      child: TextFormField(
                        controller: homectrl.editController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your title';
                          }
                          return null;
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    // Confirm Button to Add Task
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(150, 40),
                      ),
                      onPressed: () {
                        if (homectrl.formKey.currentState!.validate()) {
                          int icon =
                              icons[homectrl.chipIndex.value].icon!.codePoint;
                          String color =
                              icons[homectrl.chipIndex.value].color!.toHex();

                          // Create a new task
                          var task = Task(
                            title: homectrl.editController.text,
                            icon: icon,
                            color: color,
                          );

                          Get.back();

                          // Add the task and show success/error message
                          homectrl.addTask(task)
                              ? EasyLoading.showSuccess('Create Success')
                              : EasyLoading.showError('Duplicated Task');
                        }
                      },
                      child: const Text("Confirm"),
                    ),
                  ],
                ),
              ),
            ),
          );
          homectrl.editController.clear();
          homectrl.changeChipIndex(0);
        },
        // Dotted Border + Add Icon
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add_circle,
              size: 10.0.wp, // Responsive size
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
