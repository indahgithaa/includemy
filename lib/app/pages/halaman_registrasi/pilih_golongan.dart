import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import '../widgets/segmented_options.dart';
import '../widgets/buttons.dart';
import './pilih_pekerjaan_impian.dart';
import 'package:get/get.dart';
import 'package:includemy/controller/register_controller.dart';
import 'package:includemy/services/authentication_services.dart';

class PilihGolonganPage extends StatefulWidget {
  const PilihGolonganPage({super.key});

  @override
  State<PilihGolonganPage> createState() => _PilihGolonganPageState();
}

class _PilihGolonganPageState extends State<PilihGolonganPage> {
  String _userDisability = '';
  var _choiceIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                SvgPicture.asset('assets/logo.svg'),
                SizedBox(height: 24,),
                SvgPicture.asset('assets/cuate.svg'),
                SizedBox(height: 41,),
                Text(
                  "Yuk, Pilih Golongan Kamu!",
                  style: GoogleFonts.outfit(
                    color: ColorStyles.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 16,),
                Text(
                  "Jadi bagian dari keluarga InclusiJob dengan mendaftar sebagai salah satu dari kedua pilihan dibawah.",
                  style: GoogleFonts.outfit(
                    color: ColorStyles.greyText,
                    fontSize: 14
                  ),
                ),
                SizedBox(height: 32,),
                Container(
                  decoration: BoxDecoration(
                    color: ColorStyles.greyBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_choiceIndex != 0) {
                              setState(() {
                                _choiceIndex = 0;
                                _userDisability = "Tuna Rungu";
                                print("disabilitas:" + _userDisability);
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _choiceIndex == 0 ? ColorStyles.white : ColorStyles.greyBg,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Tuna Rungu",
                              style: GoogleFonts.outfit(
                                color: _choiceIndex == 0 ? ColorStyles.black : ColorStyles.greyText,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_choiceIndex != 1) {
                              setState(() {
                                _choiceIndex = 1;
                                _userDisability = "Tuna Daksa";
                              });
                              print("disabilitas:" + _userDisability);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _choiceIndex == 1 ? ColorStyles.white :  ColorStyles.greyBg,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Tuna Daksa",
                              style: GoogleFonts.outfit(
                                color: _choiceIndex == 1 ? ColorStyles.black : ColorStyles.greyText,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32,),
                Expanded(    
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Buttons(
                      text: "Selanjutnya", 
                      onClicked: (){
                        RegisterController.instance.updateRegistrationData(
                          dissability: _userDisability,
                        );
                        Get.to(DreamJobsPage());
                      }, 
                      width: MediaQuery.of(context).size.width, 
                      backgroundColor: ColorStyles.primary, 
                      fontColor: ColorStyles.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}