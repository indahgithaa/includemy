import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import '../widgets/segmented_options.dart';
import '../widgets/buttons.dart';

class PilihGolonganPage extends StatefulWidget {
  const PilihGolonganPage({super.key});

  @override
  State<PilihGolonganPage> createState() => _PilihGolonganPageState();
}

class _PilihGolonganPageState extends State<PilihGolonganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              SegmentedOption(),
              SizedBox(height: 32,),
              Buttons(
                text: "Selanjutnya", 
                onClicked: (){}, 
                width: MediaQuery.of(context).size.width, 
                backgroundColor: ColorStyles.primary, 
                fontColor: ColorStyles.white
              ),
            ],
          ),
        ),
      )
    );
  }
}