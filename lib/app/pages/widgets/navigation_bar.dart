import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/sertifikasi_page.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../signup_page.dart';
import '../login_page.dart';
import '../onboarding_page.dart';
import '../mentoring_page.dart';
import '../connect_page.dart';
import '../home_page.dart';
import '../applyjob_page.dart';
import '../widgets/floating_btn.dart';

class NavigationBars extends StatefulWidget {
  // final int currentTab;

  const NavigationBars({
    Key? key,
    // required this.currentTab,
  });

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int selectedIndex = 2;

  Widget _screen1 = HomePage();
  Widget _screen2 = SertifikasiPage();
  Widget _screen3 = ApplyJobPage();
  Widget _screen4 = MentoringPage();
  Widget _screen5 = ConnectPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Visibility(visible: false, child: Icon(Icons.home)),
              label: '',
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
}