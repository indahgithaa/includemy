import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar(String message) {
    Get.snackbar(
      'Informasi',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFF1355FF),
      colorText: Colors.white,
    );
  }

  static const baseUrl = 'https://includemy2-ca3db8609df9.herokuapp.com';
  static const apiAyang = 'https://mager-spot-api-v54ppgzx2a-et.a.run.app/api/v1';
}