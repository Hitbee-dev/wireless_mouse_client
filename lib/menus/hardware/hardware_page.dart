import 'package:flutter/material.dart';

class HardwarePage extends StatefulWidget {
  HardwarePage({Key? key}) : super(key: key);

  @override
  State<HardwarePage> createState() => _HardwarePageState();
}

class _HardwarePageState extends State<HardwarePage> {
  final _combo_data = ["이벤트 선택", "좌클릭", "우클릭", "뒤로가기", "앞으로가기"];
  var one = "좌클릭";
  var two = "우클릭";
  var three = "뒤로가기";
  var four = "앞으로가기";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Mouse'),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('1번 터치 이벤트'),
                subtitle: Text(one),
                trailing: DropdownButton(
                  value: _combo_data[0],
                  items: _combo_data.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      one = value.toString();
                    });
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('2번 터치 이벤트'),
                subtitle: Text(two),
                trailing: DropdownButton(
                  value: _combo_data[0],
                  items: _combo_data.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      two = value.toString();
                    });
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3번 터치 이벤트'),
                subtitle: Text(three),
                trailing: DropdownButton(
                  value: _combo_data[0],
                  items: _combo_data.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      three = value.toString();
                    });
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('4번 터치 이벤트'),
                subtitle: Text(four),
                trailing: DropdownButton(
                  value: _combo_data[0],
                  items: _combo_data.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      four = value.toString();
                    });
                  },
                ),
              ),
            ),
            Image(
              image: AssetImage(
                "images/custom.png",
              ),
              width: 200,
              height: 330,
            ),
            Center(
              child: Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    showSnackBar("저장되었습니다.");
                  },
                  child: Text(
                    "Save",
                  ),
                ),
              ),
            )
          ],
        ),
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
