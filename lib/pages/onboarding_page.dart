import 'package:flutter/material.dart';
import './widgets/buttons.dart';
import '../styles/color_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Buttons(
              text: "Daftar", 
              onClicked: (){}, 
              width: 343, 
              backgroundColor: Color(0xFF1355FF).withOpacity(1), 
              fontColor: ColorStyles.primary,
              )
            ]
          ),
      ),
    );
  }
}