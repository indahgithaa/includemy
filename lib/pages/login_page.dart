import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import './widgets/text_fields.dart';
import './widgets/password_fields.dart';
import './widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 36),
            SvgPicture.asset('assets/logo.svg'),
            SizedBox(height: 16,),
            Text(
              "Silahkan masuk menggunakan Email dan Password.",
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: ColorStyles.greyText,
              ),
            ),
            SizedBox(height: 32,),
            Text(
              "Email",
              style: GoogleFonts.outfit(
                fontSize: 14
              ),
            ),
            SizedBox(height: 8,),
            TextFields(
              textEditingController: usernameController, 
              text: "Masukkan Email", 
              textInputType: TextInputType.emailAddress, 
              icon: Icon(Icons.email_outlined, color: ColorStyles.greyText,)
            ),
            SizedBox(height: 8,),
            Text(
              "Password",
              style: GoogleFonts.outfit(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8,),
            PasswordTextFields(
              passwordController: passwordController
            ),

          ],
        ),
      ),
    );
  }
}