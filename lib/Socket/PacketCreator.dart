import 'Protocol.dart';

class PacketCreator {
  static final int MOUSE_GESTURE = 5;
  static final int MOUSE_LEFT_CLICK = 10;
  static final int MOUSE_RIGHT_CLICK = 11;
  static final int MOUSE_DOUBLE_CLICK = 12;
  static final int CAMERA_IMAGES = 7;

  static String mouseGesture(double x, double y) {
    Map data = new Map();
    data["part"] = MOUSE_GESTURE;
    data["x"] = x;
    data["y"] = y;
    return Protocol.Encoder(data);
  }

  static String mouseleftClick(int click) {
    Map data = new Map();
    data["part"] = MOUSE_LEFT_CLICK;
    data["click"] = click; // 0 = left
    return Protocol.Encoder(data);
  }

  static String mouserightClick(int click) {
    Map data = new Map();
    data["part"] = MOUSE_RIGHT_CLICK;
    data["click"] = click; // 1 = right
    return Protocol.Encoder(data);
  }

  static String mousedoubleClick(int click) {
    Map data = new Map();
    data["part"] = MOUSE_DOUBLE_CLICK;
    data["click"] = click; // 2 = double
    return Protocol.Encoder(data);
  }

  static String cameraImages(int start, String img) {
    Map data = new Map();
    data["part"] = CAMERA_IMAGES;
    data["start"] = start; //0이면 전송중, 1이면 시작점, 2면 전송완료
    data["img"] = img;
    return Protocol.Encoder(data);
  }
}
