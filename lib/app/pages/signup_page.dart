import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/text_fields.dart';
import './widgets/password_fields.dart';
import './widgets/buttons.dart';
import './login_page.dart';
import '../pages/halaman_registrasi/pilih_golongan.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? setujuKetentuan = false;

  void toggleSetujuKetentuan(bool? newValue) => setState(() {
    setujuKetentuan = newValue;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                SvgPicture.asset('assets/logo.svg'),
                SizedBox(height: 16,),
                Text(
                  "Silahkan daftar menggunakan Email dan Password.",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: ColorStyles.greyText,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  "Nama",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8,),
                TextFields(
                  textEditingController: usernameController, 
                  text: "Masukkan Nama", 
                  textInputType: TextInputType.name, 
                  icon: Icon(Icons.person_outlined, color: ColorStyles.greyText, size: 16,)
                ),
                SizedBox(height: 8),
                Text(
                  "Email",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8,),
                TextFields(
                  textEditingController: emailController, 
                  text: "Masukkan Email", 
                  textInputType: TextInputType.emailAddress, 
                  icon: Icon(Icons.email_outlined, color: ColorStyles.greyText, size: 16,)
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
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Checkbox(
                        value: setujuKetentuan, 
                        onChanged: (value) {
                          setState(() {
                            toggleSetujuKetentuan(value);
                          });
                        },
                        activeColor: ColorStyles.primary,
                        checkColor: ColorStyles.white,
                        side: BorderSide(
                          color: ColorStyles.greyOutline,
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    RichText(
                      text: TextSpan(
                        text: "Setuju dengan",
                        style: GoogleFonts.outfit(
                          color: ColorStyles.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: " ketentuan",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorStyles.primary,
                            )
                          )
                        ]
                      )
                    )
                  ]
                ),
                SizedBox(height: 34,),
                Buttons(
                  text: "Isi Biodata", 
                  onClicked: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                          return PilihGolonganPage();
                        },
                      ),
                    );
                  },
                  width: MediaQuery.of(context).size.width, 
                  backgroundColor: ColorStyles.primary, 
                  fontColor: Colors.white,
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFE9E9E9),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Atau",
                        style: GoogleFonts.outfit(
                          color: ColorStyles.greyText,
                          fontSize: 14
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFE9E9E9),
                      )
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: ColorStyles.greyOutline))),
                          elevation: MaterialStateProperty.all<double>(0),
                          minimumSize: MaterialStateProperty.all<Size>(Size(0, 52))
                        ),
                        onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/google.svg'),
                            SizedBox(width: 16,),
                            Text(
                              "Google",
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                color: ColorStyles.black,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: ColorStyles.greyOutline))),
                          elevation: MaterialStateProperty.all<double>(0),
                          minimumSize: MaterialStateProperty.all<Size>(Size(0, 52))
                        ),
                        onPressed: (){}, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/facebook.svg'),
                            SizedBox(width: 16,),
                            Text(
                              "Facebook",
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                color: ColorStyles.black,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "Sudah memiliki akun? ",
                        style: GoogleFonts.outfit(
                          color: ColorStyles.greyText,
                          fontSize: 14
                        ),
                        children: [
                          TextSpan(
                            text: "Masuk",
                            style: GoogleFonts.outfit(
                              color: ColorStyles.primary,
                              fontWeight: FontWeight.w500
                            ),
                            recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())),
                          )
                        ]
                      )
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}