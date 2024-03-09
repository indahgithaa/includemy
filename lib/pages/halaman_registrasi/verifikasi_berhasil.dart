import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import '../widgets/buttons.dart';
import '../login_page.dart';

class FinishedVerification extends StatelessWidget {
  const FinishedVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: Container(
        height: MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            SvgPicture.asset('assets/logo.svg'),
            SizedBox(height: 16),
            Text(
              "Verifikasi Berhasil!",
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16,),
            Text(
              "Verifikasi biodata sukses dilakukan. Mulai eksplorasi karir impian mu bersama Includemy!",
              style: GoogleFonts.outfit(
                color: ColorStyles.greyText,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 32,),
            Center(child: SvgPicture.asset('assets/winner.svg')),
            SizedBox(height: 60,),
            Buttons(
              text: "Masuk", 
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }, 
              width: MediaQuery.of(context).size.width, 
              backgroundColor: ColorStyles.primary, 
              fontColor: ColorStyles.white
            ),
            Expanded(
              child: Container()
            ),
            RichText(
              text: TextSpan(
                text: "Terdapat kendala? ",
                style: GoogleFonts.outfit(
                  color: ColorStyles.greyText,
                  fontSize: 14
                ),
                children: [
                  TextSpan(
                    text: "Pusat Bantuan",
                    style: GoogleFonts.outfit(
                      color: ColorStyles.primary,
                      fontWeight: FontWeight.w500
                    ),
                  //  recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage())),
                  )
                ]
              )
            ),     
          ],
        ),
      ),
    );
  }
}