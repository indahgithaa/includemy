import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/search_fields.dart';
import './widgets/mentoring_card.dart';
import 'package:video_player/video_player.dart';
import './certi_detail_page.dart';
import './widgets/attachments.dart';
import './mentoring_detail_page.dart';

class MentoringPage extends StatefulWidget {
  const MentoringPage({super.key});

  @override
  State<MentoringPage> createState() => _MentoringPageState();
}

class _MentoringPageState extends State<MentoringPage> {
  List<List<String>> mentoringList = [
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Memulai Karir Finansial", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Belajar Android", "Teknologi", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Mulai Karir Sains Data", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/contoh-mentor1.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
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
                          onClicked: (){
                            Get.to(DetailMentoringPage(
                              mentoringTitle: mentoringList[index][1],
                              rating: mentoringList[index][3],
                              mentorName: mentoringList[index][6],
                              mentorImg: mentoringList[index][7],
                              relatedField: mentoringList[index][4],
                              jmlMateri: mentoringList[index][5],
                              jmlPenilaian: mentoringList[index][8],
                              deskripsi: mentoringList[index][9],
                              tentang: mentoringList[index][10],
                              )
                            );
                          },
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