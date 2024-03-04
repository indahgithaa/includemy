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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Buttons(
              text: "Daftar", 
              onClicked: (){}, 
              width: 343, 
              backgroundColor: Color.fromRGBO(19, 85, 255, 0.05), 
              fontColor: ColorStyles.primary,
              )
            ]
          ),
      ),
    );
  }
}