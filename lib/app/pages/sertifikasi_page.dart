import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/search_fields.dart';
import './widgets/sertifikasi_card.dart';

class SertifikasiPage extends StatefulWidget {
  const SertifikasiPage({super.key});

  @override
  State<SertifikasiPage> createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {
  List<List<String>> sertifikasiList = [
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorStyles.white,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tab Sertifikasi",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black
                        ),
                      ),
                      Text(
                        "Cari minat & bakatmu disini",
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorStyles.greyText
                        )
                      ),
                    ], 
                    ),
                    SvgPicture.asset('assets/notification.svg'),
                  ],
                ),
                SizedBox(height: 16,),
                SearchBars(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hari ini • ",
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.greyText,
                    ),
                  ),
                  TextSpan(
                    text: "${sertifikasiList.length}",
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.black,
                    ),
                  ),
                  TextSpan(
                    text: " Sertifikasi baru",
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.greyText,
                    ),
                  ),
                ]
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: sertifikasiList.length,
              separatorBuilder: (context, index) => SizedBox(height: 16,),
              itemBuilder: (context, index) {
                return SertifikasiCards(
                  width: MediaQuery.of(context).size.width,
                  certiImage: sertifikasiList[index][0],
                  certiTitle: sertifikasiList[index][1],
                  companyName: sertifikasiList[index][2],
                  rating: sertifikasiList[index][3],
                  jmlPenilaian: sertifikasiList[index][4],
                  duration: sertifikasiList[index][5],
                  relatedField: sertifikasiList[index][6],
                  certiType: sertifikasiList[index][7],
                  fee: sertifikasiList[index][8],
                  updatedAt: sertifikasiList[index][9],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}