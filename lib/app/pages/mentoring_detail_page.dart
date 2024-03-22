import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './widgets/video_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/attachments.dart';
import './widgets/buttons.dart';

class DetailMentoringPage extends StatefulWidget {
    final String mentoringTitle;
    final String mentorImg;
    final String mentorName;
    final String rating;
    final String jmlPenilaian;
    final String relatedField;
    final String jmlMateri;
    final String deskripsi;
    final String tentang;

  const DetailMentoringPage({
    Key? key,
    required this.mentoringTitle,
    required this.mentorImg,
    required this.mentorName,
    required this.rating,
    required this.jmlPenilaian,
    required this.relatedField,
    required this.jmlMateri,
    required this.deskripsi,
    required this.tentang,
  });

  @override
  State<DetailMentoringPage> createState() => _DetailMentoringPageState();
}

List<List<String>> panduanAttachments = [
  ["pdf", "Panduan Pendaftaran.pdf", "4.27 MB",],
];

class _DetailMentoringPageState extends State<DetailMentoringPage> {
  // late VideoPlayerController videoPlayerController;

  // @override
  // void initState(){
  //   super.initState();
  //   videoPlayerController = VideoPlayerController.asset('assets/video_working.mp4')
  //     ..addListener(() { setState(() {}); })
  //     ..setLooping(true)
  //     ..initialize().then((value) => videoPlayerController.play());
  // }

  // @override
  // void dispose(){
  //   videoPlayerController.dispose();
  //   super.dispose();
  // }

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {

    // return VideoPlayerWidget(videoPlayerController: videoPlayerController);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 12,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Detail Mentoring",
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.black,
                                ),
                              ),
                              Text(
                                "Detail sesi mentoring",
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.greyText,
                                ),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset('assets/share.svg'),
                        SizedBox(width: 16),
                        SvgPicture.asset('assets/bookmark.svg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Image.asset('assets/mentoring_video.png'),
                  Container(
                    height: 62,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text("🎯"),
                        SizedBox(width: 8,),
                        Expanded(
                          child: RichText(
                           text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Ikuti",
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: ColorStyles.white,
                                ),
                              ),
                              TextSpan(
                                text: " program persiapan karir dengan mentor profesional untuk menggapai karir gemilang di masa depan!",
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.white,
                                ),
                              ),
                              ]
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: ColorStyles.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorStyles.greyOutline, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.mentoringTitle,
                                        style: GoogleFonts.outfit(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: ColorStyles.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset('${widget.mentorImg}'),
                                          SizedBox(width: 8,),
                                          Text(
                                            widget.mentorName,
                                            style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              color: ColorStyles.greyText,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "  • ",
                                            style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              color: ColorStyles.greyText,
                                            ),
                                          ),
                                          SvgPicture.asset('assets/verified.svg'),
                                          Text(
                                            "Verified",
                                            style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              color: ColorStyles.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/star.svg'),
                                    Text(
                                      "${widget.rating}  (${widget.jmlPenilaian} Penilaian)",
                                      style: GoogleFonts.outfit(
                                        fontSize: 12,
                                        color: ColorStyles.greyText,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.asset('assets/category.svg', height: 24,),
                              SizedBox(width: 8,),
                              Text(
                                widget.relatedField,
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  color: ColorStyles.greyText,
                                ),
                              ),
                              SizedBox(width: 16,),
                              SvgPicture.asset('assets/book.svg', height: 24,),
                              SizedBox(width: 8,),
                              Text(
                                "${widget.jmlMateri} Materi",
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  color: ColorStyles.greyText,
                                ),
                              )                            
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            widget.deskripsi,
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: ColorStyles.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyles.greyOutline, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorStyles.greyOutline,
                              width: 1,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    currentTab = 0;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 4),
                                    alignment: Alignment.center,
                                    width: 68,
                                    child: Text(
                                      "Tentang",
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: currentTab == 0 ? ColorStyles.black : ColorStyles.greyText,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: currentTab == 0 ? ColorStyles.primary : ColorStyles.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "|",
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.greyOutline,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    currentTab = 1;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 4),
                                    width: 95,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Pembelajaran",
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: currentTab == 1 ? ColorStyles.black : ColorStyles.greyText,
                                      ),
                                    ),
                                      decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: currentTab == 1 ? ColorStyles.primary : ColorStyles.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        child: currentTab == 0 ? teksTentang() : widgetPembelajaran(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 84,
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorStyles.white,
          boxShadow: [
            BoxShadow(
              color: ColorStyles.greyOutline,
              offset: Offset(0, -1),
              blurRadius: 8,
            ),
          ],
        ),
        child: Buttons(
          text: "Daftar", 
          onClicked: (){}, 
          width: MediaQuery.of(context).size.width, 
          backgroundColor: ColorStyles.primary, 
          fontColor: ColorStyles.white,
        ),
      ),
    );
  }

  Widget teksTentang(){
    return Expanded(
      child: Text(
        widget.tentang,
        style: GoogleFonts.outfit(
          fontSize: 14,
          color: ColorStyles.greyText,
        ),
      ),
    );
  }

  Widget widgetPembelajaran(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Panduan",
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorStyles.black,
              ),
            ),
            SizedBox(width: 8,),
            Container(
              alignment: Alignment.center,
              width: 20,
              height: 20,
              child: Text(
                "${panduanAttachments.length}",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: ColorStyles.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                color: ColorStyles.greyBg,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
        ListView.builder(
          padding: EdgeInsets.only(top: 16),
          shrinkWrap: true,
          itemCount: panduanAttachments.length,
          itemBuilder: (context, index){
            return Attachments(
              width: MediaQuery.of(context).size.width,
              attachmentType: panduanAttachments[index][0],
              attachmentTitle: panduanAttachments[index][1],
              attachmentInfo: panduanAttachments[index][2], // Fixed the property name
              onClicked: (){},
            );
          },
        ),
        // Row(
        //   children: [
        //     Text(
        //       "Keperluan Peserta",
        //       style: GoogleFonts.outfit(
        //         fontSize: 14,
        //         fontWeight: FontWeight.w500,
        //         color: ColorStyles.black,
        //       ),
        //     ),
        //     SizedBox(width: 8,),
        //     Container(
        //       alignment: Alignment.center,
        //       width: 20,
        //       height: 20,
        //       child: Text(
        //         "${keperluanAttachments.length}",
        //         style: GoogleFonts.outfit(
        //           fontSize: 12,
        //           color: ColorStyles.black,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //       decoration: BoxDecoration(
        //         color: ColorStyles.greyBg,
        //         borderRadius: BorderRadius.circular(100),
        //       ),
        //     ),
        //     ListView.builder(
        //       shrinkWrap: true,
        //       physics: NeverScrollableScrollPhysics(),
        //       itemCount: keperluanAttachments.length,
        //       itemBuilder: (context, index){
        //         return Attachments(
        //           width: MediaQuery.of(context).size.width,
        //           attachmentType: keperluanAttachments[index][0],
        //           attachmentTitle: keperluanAttachments[index][1],
        //           attachmentInfo: keperluanAttachments[index][2], // Fixed the property name
        //           onClicked: (){},
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}