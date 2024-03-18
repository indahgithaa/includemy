import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/controller/register_controller.dart';
import './app/pages/onboarding_page.dart';
import './app/pages/splash_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Includemy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      initialBinding: BindingsBuilder(() {
        Get.put(RegisterController());
      }),
    );
  }
}