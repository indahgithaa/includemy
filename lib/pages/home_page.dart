import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/search_fields.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/profile-default.svg',
                  width: 44,
                  height: 44, 
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hai, ${"username"}!",
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Bagaimana kabarmu hari ini?",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: ColorStyles.greyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/notification.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorStyles.white,
        ),
        child: Column(
          children: [
            SearchBars(),
          ]
        ),
      ),
    );
  }
}
