import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/widgets/buttons.dart';
import 'package:includemy/app/styles/color_styles.dart';

class KonfirmasiMengikutiSertifikasi extends StatefulWidget {
  final String sertifikasiTitle;
  final String jmlMateri;
  final String jenisMedia;
  const KonfirmasiMengikutiSertifikasi({Key? key, required this.sertifikasiTitle, required this.jmlMateri, required this.jenisMedia}) : super(key: key);

  @override
  _KonfirmasiMengikutiSertifikasiState createState() => _KonfirmasiMengikutiSertifikasiState();
}

class _KonfirmasiMengikutiSertifikasiState extends State<KonfirmasiMengikutiSertifikasi> {

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
              SvgPicture.asset(
                'assets/T-text.svg',
              ),
              SizedBox(width: 8),
              Text(
                "${widget.sertifikasiTitle}",
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
                'assets/book.svg',
                height: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.jmlMateri} Materi",
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
                'assets/tembak.svg',
                height: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${widget.jenisMedia}",
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

            },
          )
        ],
      ),
    );
  }
}
