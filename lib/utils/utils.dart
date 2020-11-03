import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showToast(String msg) {
    if (msg.isNotEmpty) {
      Fluttertoast.showToast(msg: msg);
    }
  }
}
