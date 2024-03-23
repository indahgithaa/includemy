import 'package:get/get.dart';

class JoyStickController extends GetxController {
  static bool isSwitched = false;

  static int homePageWidget = 0;

  void incrementHomePageWidget() {
    homePageWidget++;
    update();
  }

  void decrementHomePageWidget() {
    homePageWidget--;
    update();
  }
}