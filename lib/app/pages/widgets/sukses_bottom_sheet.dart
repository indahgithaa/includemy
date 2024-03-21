import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/after_login.dart';
import 'package:includemy/app/pages/home_page.dart';
import 'package:includemy/app/pages/widgets/buttons.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:get/get.dart';

class SuksesMendaftarBottomSheet extends StatefulWidget {
  final String judul;
  final String rincian;
  const SuksesMendaftarBottomSheet({Key? key, required this.judul, required this.rincian}) : super(key: key);

  @override
  _SuksesMendaftarBottomSheetState createState() => _SuksesMendaftarBottomSheetState();
}

class _SuksesMendaftarBottomSheetState extends State<SuksesMendaftarBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.white,
      ),
      height: 359,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Icon(
                  Icons.close,
                  color: ColorStyles.greyText,
                  size: 20,
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Center(
            child: SvgPicture.asset('assets/sukses_mendaftar.svg')
          ),
          SizedBox(height: 8,),
          Text(
            widget.judul,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorStyles.black,
            ),
          ),
          SizedBox(height: 8,),
          Text(
            widget.rincian,
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: ColorStyles.greyText,
            ),
          ),
          SizedBox(height: 16,),
          Buttons(
            width: MediaQuery.of(context).size.width,
            text: "Kembali",
            backgroundColor: ColorStyles.primary,
            fontColor: ColorStyles.white,
            onClicked: (){
              Get.off(AfterLogin());
            },
          )
        ],
      ),
    );
  }
}
