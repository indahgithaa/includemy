import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';

class SearchBars extends StatefulWidget {
  const SearchBars({super.key});

  @override
  State<SearchBars> createState() => _SearchBarsState();
}

class _SearchBarsState extends State<SearchBars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.greyBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: 48,
              width: MediaQuery.of(context).size.width,
              child: SearchBar(
                textStyle: MaterialStateProperty.all(GoogleFonts.outfit(color: ColorStyles.greyText, fontSize: 14)),
                leading: Icon(Icons.search, color: ColorStyles.greyText),
                hintText: "Cari sesuatu di sini ...",
                backgroundColor: MaterialStateProperty.all(ColorStyles.greyBg),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                hintStyle: MaterialStateProperty.all(
                  GoogleFonts.outfit(
                    color: ColorStyles.greyText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Text('|', style: TextStyle(color: ColorStyles.greyOutline),),
          SizedBox(width: 12,),
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/filter.svg',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  "Filter",
                  style: GoogleFonts.poppins(
                    color: ColorStyles.greyText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}