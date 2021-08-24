import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TouchPadPage extends StatefulWidget {
  const TouchPadPage({Key? key}) : super(key: key);

  @override
  State<TouchPadPage> createState() => _TouchPadPageState();
}

class _TouchPadPageState extends State<TouchPadPage> {
  String MouseClickEvent = "";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Theme.of(context).primaryColor),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 70,
                  child: RaisedButton(onPressed: () {
                    setState(() {
                      MouseClickEvent += "leftClick\n";
                    });
                  }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: 100,
                  height: 70,
                  child: RaisedButton(onPressed: () {
                    setState(() {
                      MouseClickEvent += "while\n";
                    });
                  }),
                ),
                Container(
                  width: 100,
                  height: 70,
                  child: RaisedButton(onPressed: () {
                    setState(() {
                      MouseClickEvent += "rightClick\n";
                    });
                  }),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              width: 300,
              height: 250,
              child: RaisedButton(onPressed: () {
                setState(() {
                  MouseClickEvent += "X: 321, Y: 42\n";
                });
              }),
            ),
            _Monitoring()
          ],
        ),
      ),
    );
  }

  Widget _Monitoring() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 25.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10),
              width: 300,
              child: Text(
                "Log Terminal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
          Container(
            width: 100,
            margin: EdgeInsets.only(bottom: 10),
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: 300,
            height: 300,
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child:
                    Text("${MouseClickEvent}", style: TextStyle(fontSize: 15)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
