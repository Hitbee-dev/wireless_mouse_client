import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireless_mouse/pages/bluetooth_page.dart';
import 'package:wireless_mouse/pages/hardware_page.dart';
import 'package:wireless_mouse/pages/home_page.dart';
import 'package:wireless_mouse/pages/manual_page.dart';
import 'package:wireless_mouse/pages/software_page.dart';
import 'package:wireless_mouse/pages/touchpad_page.dart';

void main() {
  runApp(WireLessMouse());
}

class WireLessMouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WireLess Mouse",
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: "/",
      getPages: [
        GetPage(
            name: "/",
            page: () => HomePage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/touchpad",
            page: () => TouchPadPage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/software",
            page: () => SoftWarePage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/hardware",
            page: () => HardWarePage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/manual",
            page: () => ManualPage(),
            transition: Transition.cupertinoDialog),
        GetPage(
            name: "/bluetooth",
            page: () => BlueToothPage(),
            transition: Transition.cupertinoDialog),
      ],
    );
  }
}
