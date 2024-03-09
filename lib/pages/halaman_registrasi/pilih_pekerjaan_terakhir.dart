import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import '../widgets/text_fields.dart';
import '../widgets/password_fields.dart';
import '../widgets/buttons.dart';
import '../widgets/pageViewIndicator.dart';
import './pilih_tanggal_lahir.dart';
import './nomor_hp.dart';

class PilihPekerjaanTerakhir extends StatefulWidget {
  const PilihPekerjaanTerakhir({super.key});

  @override
  State<PilihPekerjaanTerakhir> createState() => _PilihPekerjaanTerakhirState();
}

class _PilihPekerjaanTerakhirState extends State<PilihPekerjaanTerakhir> {
  String? _pekerjaanTerakhir;
  String? _pendidikanTerakhir;
  List<String> pekerjaans = ["Karyawan Swasta", "Pegawai Negeri"];
  List<String> pendidikans = ["Tidak sekolah","SD/Sederajat", "SMP/Sederajat", "SMA/SMK/Sederajat", "D1", "D3", "D4/S1", "S2", "S3"];

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
                  "Silahkan mengisi Pekerjaan dan Pendidikan Terakhir.",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: ColorStyles.greyText,
                  ),
                ),
                SizedBox(height: 32,),
                Text(
                  "Pekerjaan Terakhir",
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
                        Icons.work_outline_outlined,
                        size: 16,
                        color: ColorStyles.greyText,
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: DropdownButton<String>(
                        hint: Text("Pilih Pekerjaan"),
                        items: pekerjaans.map((String pekerjaan) {
                          return DropdownMenuItem<String>(
                            value: pekerjaan,
                            child: Text(pekerjaan),
                          );
                        }).toList(),
                        value: _pekerjaanTerakhir,
                        onChanged: (String? newValue) {
                          setState(() {
                            _pekerjaanTerakhir = newValue;
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
                SizedBox(height: 8,),
                Text(
                  "Pendidikan Terakhir",
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
                        Icons.school_outlined,
                        size: 16,
                        color: ColorStyles.greyText,
                      ),
                      SizedBox(width:10),
                      Expanded(
                        child: DropdownButton<String>(
                        hint: Text("Pilih Pendidikan"),
                        items: pendidikans.map((String pendidikan) {
                          return DropdownMenuItem<String>(
                            value: pendidikan,
                            child: Text(pendidikan),
                          );
                        }).toList(),
                        value: _pendidikanTerakhir,
                        onChanged: (String? newValue) {
                          setState(() {
                            _pendidikanTerakhir = newValue;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MasukkanNomorHpPage()));
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