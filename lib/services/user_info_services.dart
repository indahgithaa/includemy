import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:includemy/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:includemy/utils.dart';

class UserInfoServices extends GetxService {
  static UserInfoServices instance = Get.find();
  final Dio _dio = Dio();

  Future<User> fetchUserInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await _dio.get(
        Utils.baseUrl + '/user/profile/get-user',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        print(response.data['data']);
        return User.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load user info');
      }
    } catch (e) {
      throw Exception('Failed to load user info: $e');
    }
  }
}

