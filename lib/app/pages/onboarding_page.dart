import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/buttons.dart';
import '../pages/login_page.dart';
import '../pages/signup_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: Image.asset('assets/Shot.png', fit: BoxFit.fill,),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              height: MediaQuery.of(context).size.height / 2.7,
              child: Padding(
                padding: EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang! 👋",
                      style: GoogleFonts.outfit(
                        fontSize: 32,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 14,),
                    Text(
                      "Selamat datang di Includemy, sahabat disabilitas untuk prospek karir gemilang!",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: ColorStyles.greyText,
                      ),
                    ),
                    SizedBox(height: 32,),
                    Buttons(
                      text: "Masuk", 
                      onClicked: (){
                        Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                       LoginPage()));
                      }, 
                      width: MediaQuery.of(context).size.width, 
                      backgroundColor: ColorStyles.primary.withOpacity(0.05), 
                      fontColor: ColorStyles.primary
                    ),
                    SizedBox(height: 12,),
                    Buttons(
                      text: "Buat Akun > ",
                      onClicked: (){
                         Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                       SignupPage()));
                      },
                      width: MediaQuery.of(context).size.width, 
                      backgroundColor: ColorStyles.primary,
                      fontColor: ColorStyles.white,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
