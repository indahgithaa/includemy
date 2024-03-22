import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/buttons.dart';
import '../pages/login_page.dart';
import '../pages/signup_page.dart';

class ProfilUserPage extends StatefulWidget {
  const ProfilUserPage({super.key});

  @override
  State<ProfilUserPage> createState() => _ProfilUserPageState();
}

class _ProfilUserPageState extends State<ProfilUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(Icons.arrow_back_ios, color: ColorStyles.black, size: 12,),
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(width: 11,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tab Akun",
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.black,
                            ),
                          ),
                          Text(
                            "Pengaturan akun",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.greyText,
                            ),
                          ),
                        ],
                      ),
                    ]
                  ),
                  SvgPicture.asset('assets/notification.svg'),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}