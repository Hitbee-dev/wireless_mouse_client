import 'package:flutter/material.dart';
import 'package:wireless_mouse/Socket/PacketCreator.dart';
import 'package:wireless_mouse/Socket/SocketObject.dart';
import 'package:wireless_mouse/pages/home_page.dart';

class TouchpadPage extends StatefulWidget {
  const TouchpadPage({Key? key}) : super(key: key);

  @override
  State<TouchpadPage> createState() => _TouchpadPageState();
}

class _TouchpadPageState extends State<TouchpadPage> {
  double _cdx = 0;
  double _cdy = 0;

  double get cdx => this._cdx;
  double get cdy => this._cdy;

  set cdx(double newCdx) => this._cdx = newCdx;
  set cdy(double newCdy) => this._cdy = newCdy;

  double boxWidth = 10.0;
  double boxHeight = 10.0;

  @override
  void initState() {
    Future.microtask(() {
      _cdx = MediaQuery.of(context).size.width / 2 - (this.boxWidth / 2);
      _cdy = MediaQuery.of(context).size.height / 2 - (this.boxHeight / 2);
    }).then((_) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                      width: 120,
                      height: 70,
                      color: Colors.black,
                      child: TextButton(child: Text("Left"), onPressed: () {})),
                ),
                Container(
                    width: 60,
                    height: 70,
                    color: Colors.black,
                    child: TextButton(child: Text("Wheel"), onPressed: () {})),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                      width: 120,
                      height: 70,
                      color: Colors.black,
                      child:
                          TextButton(child: Text("Right"), onPressed: () {})),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.29,
                child: Expanded(
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        this.cdx =
                            details.globalPosition.dx - (this.boxWidth / 2);
                        this.cdy =
                            details.globalPosition.dy - (this.boxHeight / 2);

                        SocketObject.mouseSocket.write(
                            PacketCreator.mouseGesture(this.cdx, this.cdy));

                        if (this.cdx > 0) {
                          print("x: ${this.cdx}");
                        }
                        if (this.cdy > 0) {
                          print("y: ${this.cdy}");
                        }
                      });
                    },
                    child: Container(
                      color: Colors.black,
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(cdx, cdy),
                            child: Container(
                                width: this.boxWidth,
                                height: this.boxHeight,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
