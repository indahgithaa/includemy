// course_services.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:includemy/model/course.dart';

class CourseServices {
  final Dio _dio = Dio();

  Future<List<Course>> fetchCourses() async {
    try {
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
