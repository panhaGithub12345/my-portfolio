import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController


  void changeTheme() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Text(
              "Change Theme",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          TextButton.icon(
            onPressed: () {
              Get.changeThemeMode(ThemeMode.light);
              Get.back();
            },
            icon: Icon(Icons.light_mode, color: Colors.amber),
            label: Text("Light"),
          ),
          TextButton.icon(
            onPressed: () {
              Get.changeThemeMode(ThemeMode.dark);
              Get.back();
            },
            icon: Icon(Icons.dark_mode, color: Colors.blueGrey),
            label: Text("Dark"),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }

  final skills = [
    {
      'name': "React Js",
      'icon': Icons.code,
    },
    {
      'name': "Laravel",
      'icon': Icons.code,
    },
    {
      'name': "PHP",
      'icon': Icons.code,
    },
    {
      'name': "Flutter",
      'icon': Icons.code,
    },
    {
      'name': "Next Js",
      'icon': Icons.code,
    },
    {
      'name': "Figma",
      'icon': Icons.code,
    },
  ];

  final projects = [
    {
      'name': "Laravel",
      'info': "Products online with secure payments.",
      'image': "assets/images/laravel.png",
      'demo': Uri.parse("https://www.youtube.com/watch?v=Ul2IQsp5J6E"),
    },
    {
      'name': "React Js",
      'info': "Portfolio student at KiloIT and learn more about me.",
      'image': "assets/images/reactJs.png",
      'demo': Uri.parse("https://kilotravel.com/home"),
    },
    {
      'name': "Next js",
      'info': "Website that we can use to travel in Cambodia.",
      'image': "assets/images/nextJs.png",
      'demo': Uri.parse("https://kiloit.org/resources/student-hub"),
    },
  ];
}
