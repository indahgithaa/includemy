import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:includemy/controller/course_controller.dart';
import './widgets/search_fields.dart';
import './widgets/mentoring_card.dart';
import './certi_detail_page.dart';
import './widgets/attachments.dart';
import './mentoring_detail_page.dart';

class MentoringPage extends StatefulWidget {
  const MentoringPage({Key? key}) : super(key: key);

  @override
  State<MentoringPage> createState() => _MentoringPageState();
}

class _MentoringPageState extends State<MentoringPage> {
  final CourseController courseController = Get.put(CourseController());

List<List<String>> mentoringStaticList = [
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/zaneta-img.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/zaneta-img.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/zaneta-img.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/zaneta-img.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
    ["assets/contoh-program-mentoring1.png", "Persiapan Karir Dengan CV", "CV & Resume", "4.9", "Persiapan Karir", "3", "Millea Zaneta", "assets/zaneta-img.png", "100", "Curriculum Vitae merupakan suatu hal terpenting dalam melamar pekerjaan. Pada kesempatan kali ini akan dibahas lengkap mengenai pengembangan CV lebih komprehensif.", "🎯 Hal yang Akan Dipelajari \n Strategi Penulisan CV yang Efektif: Pelajari teknik dan strategi untuk menuliskan CV yang menarik perhatian perekrut. \n Pentingnya Menonjolkan Pencapaian: Temukan cara untuk menonjolkan pencapaian Anda secara efektif dalam CV Anda."],
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
              child: Obx(() {
                final count = courseController.courses.length;
                return RichText(
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
                        text: "$count",
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
                );
              }),
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
                      return Obx(() {
                        final mentorings = courseController.courses;
                        if (mentorings.isEmpty) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final mentoring = mentorings[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: MentoringCards(
                              width: MediaQuery.of(context).size.width,  
                              programImage: mentoringStaticList[index][0],
                              mentoringName: mentoring.data.userJoinCourse[index].course.title, 
                              mentoringField: mentoring.data.userJoinCourse[index].course.tags, 
                              rating: mentoringStaticList[index][3], 
                              mentoringType: mentoring.data.userJoinCourse[index].course.tags, 
                              jumlahMateri: mentoring.data.userJoinCourse[index].course.howManyCourse.toString(), 
                              namaMentor: mentoring.data.userJoinCourse[index].course.teacher, 
                              mentorImage: mentoring.data.userJoinCourse[index].course.photolink,
                              onClicked: (){
                                Get.to(DetailMentoringPage(
                                  mentoringTitle: mentoring.data.userJoinCourse[index].course.title,
                                  rating: mentoringStaticList[index][3],
                                  mentorName: mentoring.data.userJoinCourse[index].course.teacher,
                                  mentorImg: mentoring.data.userJoinCourse[index].course.photolink,
                                  relatedField: mentoring.data.userJoinCourse[index].course.tags,
                                  jmlMateri: mentoring.data.userJoinCourse[index].course.howManyCourse.toString(),
                                  jmlPenilaian: mentoringStaticList[index][8],
                                  deskripsi: mentoring.data.userJoinCourse[index].course.description,
                                  tentang: mentoringStaticList[index][9],
                                  )
                                );
                              },
                            ),
                          );
                        }
                      });
                    },
                    childCount: courseController.courses.length,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
