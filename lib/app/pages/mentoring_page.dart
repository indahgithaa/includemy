import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/search_fields.dart';
import './widgets/mentoring_card.dart';
import 'package:video_player/video_player.dart';
import './certi_detail_page.dart';
import './widgets/attachments.dart';

class MentoringPage extends StatefulWidget {
  const MentoringPage({super.key});

  @override
  State<MentoringPage> createState() => _MentoringPageState();
}

class _MentoringPageState extends State<MentoringPage> {
  List<List<String>> mentoringList = [
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png"],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png"],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png"],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png"],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DecoratedSliver(
            decoration: BoxDecoration(color: ColorStyles.white),
            sliver: SliverPadding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16,),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorStyles.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tab Mentoring",
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.black,
                                ),
                              ),
                              Text(
                                "Temukan mentor terbaik disini",
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.greyText,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/notification.svg'),
                        ],
                      ),
                      SizedBox(height: 16),
                      SearchBars(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
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
                      text: "${mentoringList.length}",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.black,
                      ),
                    ),
                    TextSpan(
                      text: " mentoring baru",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.greyText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: ColorStyles.white,
            ),
            sliver:  SliverPadding(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
               sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: MentoringCards(
                          width: MediaQuery.of(context).size.width,  
                          programImage: mentoringList[index][0],
                          mentoringName: mentoringList[index][1], 
                          mentoringField: mentoringList[index][2], 
                          rating: mentoringList[index][3], 
                          mentoringType: mentoringList[index][4], 
                          jumlahMateri: mentoringList[index][5], 
                          namaMentor: mentoringList[index][6], 
                          mentorImage: mentoringList[index][7],
                        ),
                      );
                    },
                    childCount: mentoringList.length,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
