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
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        // Wrap content in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://media.licdn.com/dms/image/D4E03AQEYFh_cteiGHw/profile-displayphoto-shrink_200_200/0/1675684299451?e=2147483647&v=beta&t=v--ECS2UF_XDYsH7WWSV4IM_IElPKfVgR6Br8umkCxw",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Malak Idrissi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Rabat, Morocco",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Spacer(), // Added Spacer to push the edit icon to the right
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_rounded,
                        color: Colors.black,
                      ))
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi! My name is Malak, I'm a community manager",
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      "from Rabat, Morocco.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
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
      ),
    );
  }
}
