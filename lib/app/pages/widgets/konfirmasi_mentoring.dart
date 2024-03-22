import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/widgets/buttons.dart';
import 'package:includemy/app/pages/widgets/sukses_bottom_sheet.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:includemy/controller/bottomsheet_controller.dart';

class KonfirmasiMengikutiMentoring extends StatefulWidget {
  final String keahlian;
  final String jmlPeserta;
  final String relatedField;
  const KonfirmasiMengikutiMentoring({Key? key, required this.keahlian, required this.jmlPeserta, required this.relatedField}) : super(key: key);
 
  @override
  _KonfirmasiMengikutiMentoringState createState() => _KonfirmasiMengikutiMentoringState();
}

class _KonfirmasiMengikutiMentoringState extends State<KonfirmasiMengikutiMentoring> {
  final BottomSheetController bottomSheetController = Get.put(BottomSheetController());

  @override
  initState() {
    bottomSheetController.setKonfirmasiShown(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.white,
      ),
      height: 232,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Konfirmasi Mengikuti Sertifikasi",
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.black,
                ),
              ),
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
          Divider(
            color: ColorStyles.greyOutline,
            thickness: 1,
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              Icon(
                Icons.person_outline_outlined,
                color: ColorStyles.greyText,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.jmlPeserta} Peserta",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.greyText,
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SvgPicture.asset(
                'assets/kantor.svg',
                height: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.keahlian}",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.greyText,
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SvgPicture.asset(
                'assets/graph.svg',
                height: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.relatedField}",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.greyText,
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Buttons(
            width: MediaQuery.of(context).size.width,
            text: "Ikuti",
            backgroundColor: ColorStyles.primary,
            fontColor: ColorStyles.white,
            onClicked: (){
              Navigator.pop(context);
              if (!bottomSheetController.isKonfirmasiShown) {
                showModalBottomSheet(
                  context: context, 
                  builder: (context){
                    return SuksesMendaftarBottomSheet(
                      judul: "Sukses Mendaftar",
                      rincian: "Segala informasi akan disampaian pada tab tautan.",
                    );
                  }
                );
                bottomSheetController.setKonfirmasiShown(true);
              }
            },
          )
        ],
      ),
    );
  }
}
