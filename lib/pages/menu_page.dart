import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireless_mouse/pages/home_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${(Get.arguments as IPStatus).ip}"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {}, child: Container(child: Text("TouchPad"))),
              ElevatedButton(
                  onPressed: () {}, child: Container(child: Text("Camera"))),
              ElevatedButton(
                  onPressed: () {}, child: Container(child: Text("HardWare"))),
            ],
          ),
        ),
      ),
    );
  }
}
