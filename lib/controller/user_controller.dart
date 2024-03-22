import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includemy/model/user.dart';
import 'package:includemy/services/user_info_services.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo(); 
  }

  Future<void> fetchUserInfo() async {
    try {
      final user = await UserInfoServices.instance.fetchUserInfo();
      if (user != null) {
        this.user.value = user;
      }
    } catch (e) {
      print('Failed to fetch user info: $e');
    }
  }
}
