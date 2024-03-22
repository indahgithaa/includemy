import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/widgets/joystick.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/buttons.dart';
import '../pages/login_page.dart';
import '../pages/signup_page.dart';

class ProfilUserPage extends StatefulWidget {
  final String name;
  final String email;
  const ProfilUserPage({
    Key? key,
    required this.name,
    required this.email,
  });

  @override
  State<ProfilUserPage> createState() => _ProfilUserPageState();
}

class _ProfilUserPageState extends State<ProfilUserPage> {
  int currentWidget = 0;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/profile-default.svg', height: 64,),
                          SizedBox(width: 16,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.black,
                                ),
                              ),
                              Text(
                                widget.email,
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.greyText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                       Icon(
                        Icons.arrow_forward_ios,
                        color: ColorStyles.black,
                        size: 12,
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text(
                    "Pengaturan Umum",
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.black,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/mode.svg'),
                          SizedBox(width: 16,),
                          Text(
                            "Mode Disabilitas",
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorStyles.greyText,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        activeColor: ColorStyles.primary,
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/lacak.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Lacak Status Lamaran",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/boomark2.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Unggahan Tersimpan",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/perlindungan.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Perlindungan & Keamanan",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengaturan Khusus",
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.black,
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/tandatanya.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Pusat Bantuan",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/peringatan.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Syarat & Ketentuan",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/delay.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Histori Aktivitas",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/message2.svg'),
                      SizedBox(width: 16,),
                      Text(
                        "Preferensi Email",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorStyles.greyBg,
                    thickness: 1,
                  ),
                ],
              ),
            ), 
          ]
        ),
      ),
      floatingActionButton: isSwitched ? JoyStickWidget() : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}