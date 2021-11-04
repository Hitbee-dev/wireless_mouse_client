import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
    return Stack(children: [
      backgroudImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  this.cdx = details.globalPosition.dx - (this.boxWidth / 2);
                  this.cdy = details.globalPosition.dy - (this.boxHeight / 2);

                  SocketObject.mouseSocket
                      .write(PacketCreator.mouseGesture(this.cdx, this.cdy));

                  if (this.cdx > 0) {
                    print("x: ${this.cdx}");
                  }
                  if (this.cdy > 0) {
                    print("y: ${this.cdy}");
                  }
                });
              },
              onDoubleTap: () {
                SocketObject.mouseSocket
                    .write(PacketCreator.mousedoubleClick(2));
                print("doubleclick");
              },
              onTapUp: (TapUpDetails details) {
                setState(() {
                  this.cdx = details.globalPosition.dx - (this.boxWidth / 2);
                  this.cdy = details.globalPosition.dy - (this.boxHeight / 2);

                  if (this.cdy < 400) {
                    SocketObject.mouseSocket
                        .write(PacketCreator.mouseleftClick(0));
                    print("leftclick");
                  } else if (this.cdy > 400) {
                    SocketObject.mouseSocket
                        .write(PacketCreator.mouserightClick(1));
                    print("rightclick");
                  }
                });
              },
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(cdx, cdy),
                      child: Container(
                          width: this.boxWidth,
                          height: this.boxHeight,
                          color: Colors.transparent),
                    )
                  ],
                ),
              ),
            ),
          )),
    ]);
  }

  Widget backgroudImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          // fit: BoxFit.cover,
        ),
      ),
    );

    // return ShaderMask(
    //   shaderCallback: (bounds) => LinearGradient(
    //     colors: [Colors.black, Colors.black12],
    //     begin: Alignment.bottomCenter,
    //     end: Alignment.center,
    //   ).createShader(bounds),
    //   // blendMode: BlendMode.darken,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('images/background.png'),

    //         /// change this to your  image directory
    //         fit: BoxFit.cover,
    //         colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
    //       ),
    //     ),
    //   ),
    // );
  }
}
