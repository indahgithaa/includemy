import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomSheetController extends GetxController {
  bool isKonfirmasiShown = false;

  void setKonfirmasiShown(bool value) {
    isKonfirmasiShown = value;
    update();
  }
}
