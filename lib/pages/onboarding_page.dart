import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/buttons.dart';
import '../styles/color_styles.dart';
import './widgets/text_fields.dart';
import './widgets/segmented_options.dart';
import './widgets/password_fields.dart';
import './widgets/chip_options.dart';
import './widgets/navigation_bar.dart';
import './widgets/floating_btn.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _userDisability = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingBtn(),
      bottomNavigationBar: NavigationBars(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: GoogleFonts.outfit(
                  color: ColorStyles.greyText
                ),
              ),
              TextFields(
                textEditingController: usernameController, 
                text: "Masukkan Email",
                textInputType: TextInputType.name, 
                icon: Icon(
                  Icons.email_outlined,
                  color: ColorStyles.greyText,
                )
              ),
              SizedBox(height: 15,),
              PasswordTextFields(passwordController: passwordController),
              SizedBox(height: 15,),
              Row(
                children: [
                  ChipOptions(
                    icon: "💻",
                    job: "Administrasi"
                    )
                ],
              ),
              SizedBox(height: 15,),
              SegmentedOption(),
              SizedBox(height: 15,),
              Buttons(
              text: "Daftar", 
              onClicked: (){}, 
              width: 343, 
              backgroundColor: Color.fromRGBO(19, 85, 255, 0.05), 
              fontColor: ColorStyles.primary,

              ),
            ]
            
          ),
          
        ),
      ),
    );
  }
}