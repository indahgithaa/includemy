import 'package:flutter/material.dart';
import '../services/authentication_services.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../utils.dart';

class RegisterController extends GetxController {
  static RegisterController instance = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final disabilitasType = "".obs;
  final jenisKelamin = "".obs;
  final pekerjaanTerakhir = "".obs;
  final pendidikanTerakhir = "".obs;
  final preferenceJob = "".obs;

  void updateRegistrationData({
    String? name,
    String? email,
    String? password,
    String? born,
    String? gender,
    String? lastjob,
    String? lastedu,
    String? contact,
    String? preference,
    String? dissability,
  }) {
    if (name != null) nameController.text = name;
    if (email != null) emailController.text = email;
    if (password != null) passwordController.text = password;
    if (born != null) birthdateController.text = born;
    if (gender != null) jenisKelamin.value = gender;
    if (lastjob != null) pekerjaanTerakhir.value = lastjob;
    if (lastedu != null) pendidikanTerakhir.value = lastedu;
    if (contact != null) phoneController.text = contact;
    if (preference != null) preferenceJob.value = preference;
    if (dissability != null) disabilitasType.value = dissability;
  }
}