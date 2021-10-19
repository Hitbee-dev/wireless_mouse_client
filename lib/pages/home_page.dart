import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _questionText = "";
  bool hideIP = false;
  TextEditingController _questionController = TextEditingController();
  TextEditingController _ipController = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("무선마우스",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              showSnackBar("구현 진행중..");
            },
            icon: Icon(Icons.menu)),
        actions: [_SendButton()],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              _IPdata("IP Address", "192.168.0.1"),
              _InfoWidget(context),
              _Questions()
            ],
          );
        },
      ),
    );
  }

  Widget _IPdata(String nameIP, String hintIP) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: _ipController,
        onChanged: (value) {
          // print(value); 실시간 IP 변화 값
        },
        obscureText: hideIP,
        decoration: InputDecoration(
          prefixIcon: hideIP ? Icon(Icons.lock) : Icon(Icons.lock_open),
          suffixIcon: IconButton(
            icon: hideIP ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                hideIP = !hideIP;
              });
            },
          ),
          labelText: nameIP,
          hintText: hintIP,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _SendButton() {
    return IconButton(
        onPressed: () {
          // showSnackBar("접속 실패! IP를 확인 해 주세요.");
          Get.toNamed("/menu", arguments: IPStatus(ip: _ipController.text));
          setState(() {
            _ipController.text = "";
          });
        },
        icon: Icon(Icons.send));
  }

  Widget _InfoWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                      height: 150,
                      child: Text(
                          '1. IP 입력\n'
                          '   1) 서버프로그램 실행\n'
                          '   2) 출력된 IP 입력\n\n'
                          '2. 인증\n'
                          '   1) 우측 상단 버튼 클릭\n'
                          '   2) 오류 발생 시 IP 확인\n',
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

  Widget _Questions() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _questionController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onChanged: (text) {
              setState(() {
                _questionText = text;
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_search),
              helperText: '문제점이 있거나, 개선사항이 필요한 경우 문의사항을 이용해주세요.',
              hintText: '문의사항을 적어주세요.(최대 200자)',
              hintStyle: TextStyle(fontSize: 15),
              contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.topLeft,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("문의사항: $_questionText"),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              if (_questionText == "") {
                showSnackBar("내용이 없습니다.");
              } else {
                showSnackBar("문의 접수가 완료되었습니다.");
                setState(() {
                  _questionText = "";
                  _questionController.text = "";
                });
              }
            },
            label: Text("문의사항 접수하기",
                style: TextStyle(fontSize: 18, color: Colors.grey)),
            icon: Icon(Icons.send, size: 18, color: Colors.grey),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: '확인',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class IPStatus {
  String ip;

  IPStatus({required this.ip});
}
