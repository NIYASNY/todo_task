import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_task/app/controller/auth_controller.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return Text(
                '${authController.user?.displayName ?? 'No Name'}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(height: 60),

            // Dark/Light Mode Toggle
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Dark/Light Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                    if (isDarkMode) {
                      Get.changeThemeMode(ThemeMode.dark);
                    } else {
                      Get.changeThemeMode(ThemeMode.light);
                    }
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),

            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                authController.signOut();
              },
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Todo Task',
                  applicationVersion: '1.0.0',
                  applicationIcon: Icon(Icons.task),
                  children: [
                    Text('This is a task management application.'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
