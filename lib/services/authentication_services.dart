import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:includemy/app/styles/color_styles.dart';
import '../utils.dart';

class AuthenticationServices {
  final Dio _dio = Dio();

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String born,
    required String gender,
    required String lastjob,
    required String lastedu,
    required String contact,
    required String preference,
    required String dissability,
  }) async {
    try {
      final response = await _dio.post(
        Utils.baseUrl + '/signin',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "born": born,
          "gender": gender,
          "lastjob": lastjob,
          "lastedu": lastedu,
          "contact": contact,
          "preference": preference,
          "dissability": dissability,
        }
    );
      print(response.data);
      Utils.showSnackBar("Registrasi berhasil");
    } catch (e) {
      print(e);
      Utils.showSnackBar("Registrasi gagal");
    }
  }
}