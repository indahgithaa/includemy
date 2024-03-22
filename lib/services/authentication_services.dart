import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:includemy/model/course.dart';
import 'package:includemy/services/token_storage.dart';
import 'package:includemy/services/token_storage.dart';
import 'package:includemy/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices extends GetxService {
  final Dio _dio = Dio();
  final TokenStorage _tokenStorage = Get.find<TokenStorage>(); // Inject TokenStorage
  
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required DateTime born,
    required String gender,
    required String lastjob,
    required String lastedu,
    required String contact,
    required String preference,
    required String dissability,
  }) async {
    try {
      final response = await _dio.post(
        Utils.baseUrl + '/register',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "born": born.toUtc().toIso8601String(),
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
      print('Request failed with error: $e');
      Utils.showSnackBar("Registrasi gagal");
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        Utils.baseUrl + '/login',
        data: {
          "email": email,
          "password": password,
        }
      );
      final token = response.data['token']; // Extract token from response
      await _tokenStorage.storeToken(token); // Store token using TokenStorage
      Utils.showSnackBar("Login berhasil");
    } catch (e) {
      print('Request failed with error: $e');
      Utils.showSnackBar("Login gagal");
    }
  }
}
class CourseServices extends GetxService {
  final Dio _dio = Dio();
  final TokenStorage _tokenStorage = Get.put(TokenStorage()); // Inject TokenStorage

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
