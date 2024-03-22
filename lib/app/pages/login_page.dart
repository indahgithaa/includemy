import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:includemy/controller/register_controller.dart';
import 'package:includemy/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widgets/text_fields.dart';
import './widgets/password_fields.dart';
import './widgets/buttons.dart';
import './signup_page.dart';
import './home_page.dart';
import './after_login.dart';
import './sertifikasi_page.dart';
import 'package:get/get.dart';
import 'package:includemy/services/authentication_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? rememberMe = false;
  late SharedPreferences prefs;

  void toggleRememberMe(bool? newValue) => setState(() {
    rememberMe = newValue;
  });

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences(); // Initialize SharedPreferences
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance(); // Await SharedPreferences initialization
  }
  
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
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8,),
                TextFields(
                  textEditingController: emailController, 
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
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Checkbox(
                            value: rememberMe, 
                            onChanged: (value) {
                              setState(() {
                                toggleRememberMe(value);
                              });
                            },
                            activeColor: ColorStyles.primary,
                            checkColor: ColorStyles.white,
                            side: BorderSide(
                              color: ColorStyles.greyOutline,
                            ),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Text(
                          "Ingat akun",
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                          ),
                        )
                      ]
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "Lupa Password?",
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.primary
                        ),
                      ),
                    )
                  ]
                ),
                SizedBox(height: 34,),
                Buttons(
                  text: "Masuk", 
                  onClicked: (){
                    AuthenticationServices().login(
                      email: emailController.text, 
                      password: passwordController.text
                    );
                    Get.to(() => AfterLogin());
                    //print stored to
                    print(prefs.getString('token'));
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
                        onPressed: (){
                          print(emailController.text);  
                          print(passwordController.text);
                        }, 
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
                        text: "Belum memiliki akun? ",
                        style: GoogleFonts.outfit(
                          color: ColorStyles.greyText,
                          fontSize: 14
                        ),
                        children: [
                          TextSpan(
                            text: "Buat Akun",
                            style: GoogleFonts.outfit(
                              color: ColorStyles.primary,
                              fontWeight: FontWeight.w500
                            ),
                            recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage())),
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