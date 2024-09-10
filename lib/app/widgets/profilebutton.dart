import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/modules/home/widgets/settings.dart';

class ProfileButton extends StatelessWidget {
  final String imagePath;
  final Widget destinationPage;

  const ProfileButton({
    Key? key,
    required this.imagePath,
    required this.destinationPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => SettingsPage());
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle, 
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover, 
          ),
        ),
      ),
    );
  }
}
