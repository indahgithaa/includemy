import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage extends GetxService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeToken(String token) async {
    await init();
    await _prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    await init();
    return _prefs.getString('token');
  }
}
