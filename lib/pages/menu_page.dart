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
              _menuButton("TouchPad", () {
                Get.toNamed("/touchpad");
              }),
              _menuButton("Camera", () {
                Get.toNamed("/camera");
              }),
              _menuButton("HardWare", () {
                Get.toNamed("/hardware");
              }),
              _InfoWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuButton(String name, Function) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Card(
        elevation: 7,
        child: ElevatedButton(
            onPressed: Function,
            child: Container(
                width: 200, height: 50, child: Center(child: Text(name)))),
      ),
    );
  }

  Widget _InfoWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
      child: Card(
        elevation: 6,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.menu_book, size: 18, color: Colors.black87),
                  Text(
                    '  사용안내',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                  Spacer(),
                  Icon(Icons.more_vert, size: 18, color: Colors.black87),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              decoration: BoxDecoration(
                color: Colors.amber[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 160,
                      child: Text(
                          '1. TouchPad\n'
                          '   - 노트북과 같은 트랙패드 형식으로 사용\n\n'
                          '2. Camera\n'
                          '   - 카메라를 이용한 이미지 트랙킹 기법으로 사용\n\n'
                          '3. HardWare\n'
                          '   - 추가 장치를 사용하여 실제 마우스 형식으로 사용\n\n',
                          style: TextStyle(color: Colors.black87))),
                ],
              ),
            ),
            Divider(height: 2, color: Colors.black26),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.history, size: 16, color: Colors.black38),
                  Text('  Copyright© 2021 HCI All rights reserved.',
                      style: TextStyle(fontSize: 13, color: Colors.black38)),
                  Spacer(),
                  Icon(Icons.chevron_right, size: 16, color: Colors.black38),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            )
          ],
        ),
      ),
    );
  }
}
