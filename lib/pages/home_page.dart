import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WireLessMouse"), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ]),
      body: Center(
        child: Container(
          child: Column(
            children: [
              moveButton("TouchPad", "/touchpad"),
              moveButton("SoftWare", "/software"),
              moveButton("HardWare", "/hardware"),
              moveButton("BlueTooth", "/bluetooth"),
            ],
          ),
        ),
      ),
    );
  }

  Widget moveButton(String name, String paged) {
    return Container(
        padding: EdgeInsets.only(top: 30),
        width: 200,
        height: 80,
        child: RaisedButton(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            onPressed: () {
              Get.toNamed(paged);
            }));
  }
}
