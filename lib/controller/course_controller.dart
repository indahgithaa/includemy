import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:includemy/model/course.dart';
import 'package:includemy/services/course_services.dart';
import 'package:includemy/utils.dart';

class CourseController extends GetxController {
  final CourseServices _courseServices = CourseServices();
  var courses = <Course>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      final fetchedCourses = await _courseServices.fetchCourses();
      courses.value = fetchedCourses;
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
}
