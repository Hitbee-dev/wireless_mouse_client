import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireless_mouse/menus/camera/camera_page.dart';
import 'package:wireless_mouse/menus/hardware/hardware_page.dart';
import 'package:wireless_mouse/menus/touchpad/touchpad_page.dart';
import 'package:wireless_mouse/pages/home_page.dart';
import 'package:wireless_mouse/pages/menu_page.dart';

void main() {
  runApp(WireLessMouse());
}

class WireLessMouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "무선마우스",
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: "/",
      getPages: [
        GetPage(
            name: "/",
            page: () => HomePage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/menu",
            page: () => MenuPage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/touchpad",
            page: () => TouchpadPage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/camera",
            page: () => CameraPage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/hardware",
            page: () => HardwarePage(),
            transition: Transition.cupertinoDialog),
      ],
    );
  }
}
