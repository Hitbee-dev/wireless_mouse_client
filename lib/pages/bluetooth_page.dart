import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BlueToothPage extends StatefulWidget {
  const BlueToothPage({Key? key}) : super(key: key);

  @override
  _BlueToothPageState createState() => _BlueToothPageState();
}

class _BlueToothPageState extends State<BlueToothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 300,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            // Start scanning
            flutterBlue.startScan(timeout: Duration(seconds: 4));

            // Stop scanning
            flutterBlue.stopScan();
          },
          child: Text("connect"),
        ),
      ),
    );
  }
}
