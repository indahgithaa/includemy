import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:includemy/model/course.dart';
import 'package:includemy/services/token_storage.dart';
import 'package:get/get.dart';

class CourseServices extends GetxService {
  final Dio _dio = Dio();
  final TokenStorage _tokenStorage = Get.put(TokenStorage()); 

  Future<List<Course>> fetchCourses() async {
    try {
      await _tokenStorage.init(); // Initialize TokenStorage

      final token = await _tokenStorage.getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      _dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await _dio.get('https://includemy2-ca3db8609df9.herokuapp.com/user/course');
      if (response.statusCode == 200) {
        final coursesJson = response.data['data'] as List<dynamic>;
        final courses = coursesJson.map((json) => Course.fromJson(json)).toList();
        return courses;
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      throw Exception('Failed to load courses: $e');
    }
  }
}
