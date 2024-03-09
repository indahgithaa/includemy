import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import '../widgets/text_fields.dart';
import '../widgets/password_fields.dart';
import '../widgets/buttons.dart';
import '../widgets/pageViewIndicator.dart';
import './pilih_pekerjaan_terakhir.dart';

class MasukkanNomorHpPage extends StatefulWidget {
  const MasukkanNomorHpPage({super.key});

  @override
  State<MasukkanNomorHpPage> createState() => _MasukkanNomorHPPage();
}

class _MasukkanNomorHPPage extends State<MasukkanNomorHpPage> {
  TextEditingController phoneNumberController = TextEditingController();
  String? _selectedGender;
  List<String> genders = ["Perempuan", "Laki-laki"];

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
                  "Silahkan mengisi Nomor HP aktif.",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: ColorStyles.greyText,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  "Nomor HP",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: ColorStyles.greyOutline, // Focused border color
                    ),
                  ),
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.phone),
                        SizedBox(width: 8,),
                        Text('+62', style: GoogleFonts.outfit(fontSize: 14, color: ColorStyles.greyText),),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextFormField(
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: ColorStyles.greyText
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(4),
                              isCollapsed: true,
                              hintText: ('- 00000 - 00000'),
                              hintStyle: TextStyle(
                                color: ColorStyles.greyText,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                ),
                SizedBox(height: 34,),
                Buttons(
                  text: "Selanjutnya", 
                  onClicked: (){
                  }, 
                  width: MediaQuery.of(context).size.width, 
                  backgroundColor: ColorStyles.primary, 
                  fontColor: Colors.white,
                ),
                Buttons(
                  text: "< Sebelumnya", 
                  onClicked: (){}, 
                  width: MediaQuery.of(context).size.width, 
                  backgroundColor: ColorStyles.white, 
                  fontColor: ColorStyles.greyText,
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PageViewIndicators(
                      indicator1: ColorStyles.selectionBlack, 
                      indicator2: ColorStyles.selectionBlack, 
                      indicator3: ColorStyles.selectionBlack,
                    ),
                    SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        text: "Terdapat kendala? ",
                        style: GoogleFonts.outfit(
                          color: ColorStyles.greyText,
                          fontSize: 14
                        ),
                        children: [
                          TextSpan(
                            text: "Pusat Bantuan",
                            style: GoogleFonts.outfit(
                              color: ColorStyles.primary,
                              fontWeight: FontWeight.w500
                            ),
                          //  recognizer: TapGestureRecognizer() ..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage())),
                          )
                        ]
                      )
                    ),     
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}