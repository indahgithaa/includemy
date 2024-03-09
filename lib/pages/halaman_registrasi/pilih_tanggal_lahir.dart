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

class PilihTanggalLahirPage extends StatefulWidget {
  const PilihTanggalLahirPage({super.key});

  @override
  State<PilihTanggalLahirPage> createState() => _PilihTanggalLshirPageState();
}

class _PilihTanggalLshirPageState extends State<PilihTanggalLahirPage> {
  TextEditingController birthDateController = TextEditingController();
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
                  "Silahkan mengisi Tanggal Lahir dan Jenis Kelamin.",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: ColorStyles.greyText,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  "Tanggal Lahir",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8,),
                TextFields(
                  textEditingController: birthDateController, 
                  text: "DD / MM / YY", 
                  textInputType: TextInputType.datetime, 
                  icon: Icon(Icons.calendar_today_outlined, color: ColorStyles.greyText, size: 16,)
                ),
                SizedBox(height: 8,),
                Text(
                  "Jenis Kelamin",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyles.greyOutline),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  padding: EdgeInsets.all(8),
                  height: 44,
                  child: Row(
                    children: [
                      Icon(
                        _selectedGender == "Perempuan" ? Icons.female : _selectedGender == "Laki-laki" ? Icons.male : Icons.male,
                        color: ColorStyles.greyText,
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: DropdownButton<String>(
                        hint: Text("Pilih Jenis Kelamin"),
                        items: genders.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        value: _selectedGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                        isExpanded: true, 
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          color: ColorStyles.greyText,
                        ), 
                        underline: Container(), 
                        itemHeight: kMinInteractiveDimension,
                                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                SizedBox(height: 34,),
                Buttons(
                  text: "Selanjutnya", 
                  onClicked: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => PilihPekerjaanTerakhir()));
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
                      indicator2: ColorStyles.greyBg, 
                      indicator3: ColorStyles.greyBg
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