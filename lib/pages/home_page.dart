import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WireLessMouse"), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ]),
      body: Container(
          child: Center(
        child: Column(
          children: [
            RaisedButton(onPressed: () {
              Get.toNamed("/touchpad");
            }),
            RaisedButton(onPressed: () {
              Get.toNamed("/software");
            }),
            RaisedButton(onPressed: () {
              Get.toNamed("/hardware");
            }),
            RaisedButton(onPressed: () {
              Get.toNamed("/bluetooth");
            }),
          ],
        ),
      )),
    );
  }
}
