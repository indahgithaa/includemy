import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/applyjob_page.dart';
import 'package:includemy/app/pages/connect_page.dart';
import 'package:includemy/app/pages/home_page.dart';
import 'package:includemy/app/pages/mentoring_page.dart';
import 'package:includemy/app/pages/sertifikasi_page.dart';
import 'package:includemy/app/pages/widgets/floating_btn.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:includemy/controller/joystick_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AfterLogin extends StatefulWidget {
  const AfterLogin({super.key});

  @override
  State<AfterLogin> createState() => _AfterLoginState();
}

class _AfterLoginState extends State<AfterLogin> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences(); // Initialize SharedPreferences
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance(); // Await SharedPreferences initialization
  }
  
  int selectedIndex = 0;
  Widget _screen1 = HomePage();
  Widget _screen2 = SertifikasiPage();
  Widget _screen3 = ApplyJobPage();
  Widget _screen4 = MentoringPage();
  Widget _screen5 = ConnectPage();

  final JoyStickController joyStickController = Get.find<JoyStickController>();
  
  @override
  Widget build(BuildContext context) {
    JoyStickController.isSwitched ? JoyStickController.homePageWidget = 0 : -1;
    return Stack(
      children: [
        Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorStyles.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          showUnselectedLabels: true,
          enableFeedback: false,
          onTap: onTapHandler,
          iconSize: 24,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: GoogleFonts.outfit(
            color: ColorStyles.primary,
          ),
          unselectedLabelStyle: GoogleFonts.outfit(
            color: ColorStyles.greyText,
          ),
          selectedItemColor: ColorStyles.primary,
          unselectedItemColor: ColorStyles.greyText,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg',),
              label: "Utama",
              activeIcon: SvgPicture.asset('assets/home_filled.svg'),
              
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/certificate.svg',),
              label: "Sertifikasi",
              activeIcon: SvgPicture.asset('assets/certificate_filled.svg',),
            ),
            BottomNavigationBarItem(
              icon: Container(
                child: GestureDetector(
                  child: Container(),
                  onTap: null,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/mentoring.svg',),
              label: "Mentoring",
              activeIcon: SvgPicture.asset('assets/mentoring_filled.svg',),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/connect.svg',),
              label: "Connect",
              activeIcon: SvgPicture.asset('assets/connect_filled.svg',),
            )
          ],
        ),
        floatingActionButton: Container(
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height - 68),
            FloatingBtn(),
          ]),
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      JoyStickController.isSwitched ? joyStickWidget() : Container(),
      ]
    );
  }

   void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._screen1;
    } else if (this.selectedIndex == 1) {
      return this._screen2;
    } else if (this.selectedIndex == 2) {
      return this._screen3;
    } else if (this.selectedIndex == 3) {
      return this._screen4;
    }
    return this._screen5;
  }

   Widget joyStickWidget() {
    return Positioned(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 224,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF252525),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: ColorStyles.greyText.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    joyStickController.decrementHomePageWidget();
                  });
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFF363636),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ColorStyles.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () {
                 if (JoyStickController.homePageWidget == 0) {
                    Navigator.pop(context);
                  }
                },
                child: SvgPicture.asset('assets/middlebuttonjoystick.svg')
              ),
              SizedBox(width: 24),
              GestureDetector(
                onTap: () {
                  setState(() {
                    joyStickController.incrementHomePageWidget();
                  });
                  print(JoyStickController.homePageWidget);
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFF363636),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorStyles.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}