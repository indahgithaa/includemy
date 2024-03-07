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
  bool? rememberMe = false;

  void toggleRememberMe(bool? newValue) => setState(() {
    rememberMe = newValue;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SingleChildScrollView(
        child: Padding(
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
                  fontSize: 14,
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
                onClicked: (){}, 
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
              )
            ],
          ),
        ),
      ),
    );
  }
}