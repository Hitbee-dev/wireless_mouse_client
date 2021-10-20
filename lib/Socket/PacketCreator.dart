import 'Protocol.dart';

class PacketCreator {
  static final int MOUSE_GESTURE = 5;

  static String mouseGesture(double x, double y) {
    Map data = new Map();
    data["part"] = MOUSE_GESTURE;
    data["x"] = x;
    data["y"] = y;
    return Protocol.Encoder(data);
  }
}
