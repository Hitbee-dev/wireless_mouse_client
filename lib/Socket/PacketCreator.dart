import 'Protocol.dart';

class PacketCreator {
  static final int MOUSE_GESTURE = 100;

  static String mouseGesture(String x, String y) {
    Map data = new Map();
    data["part"] = MOUSE_GESTURE;
    data["x"] = x;
    data["y"] = y;
    return Protocol.Encoder(data);
  }
}
