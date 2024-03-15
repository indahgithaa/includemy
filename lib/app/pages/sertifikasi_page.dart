import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/search_fields.dart';
import './widgets/sertifikasi_card.dart';
import 'package:video_player/video_player.dart';

class SertifikasiPage extends StatefulWidget {
  const SertifikasiPage({super.key});

  @override
  State<SertifikasiPage> createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState(); 

    _videoPlayerController = VideoPlayerController.asset(
      'assets/video_working.mp4'
    )..initialize().then((_) {
      _videoPlayerController.play();
      setState(() {
        
      });
    });
  }

  List<List<String>> sertifikasiList = [
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
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
                                "Tab Sertifikasi",
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.black,
                                ),
                              ),
                              Text(
                                "Cari minat & bakatmu disini",
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
                        child: SertifikasiCards(
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
                          onClicked: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => DetailPage(
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
                                  videoPlayerController: _videoPlayerController,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    childCount: sertifikasiList.length,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
    final String certiImage;
    final String certiTitle;
    final String companyName;
    final String rating;
    final String jmlPenilaian;
    final String duration;
    final String relatedField;
    final String certiType;
    final String fee;
    final String updatedAt;
    final VideoPlayerController videoPlayerController;

  const DetailPage({
    Key? key,
    required this.certiImage,
    required this.certiTitle,
    required this.companyName,
    required this.rating,
    required this.jmlPenilaian,
    required this.duration,
    required this.relatedField,
    required this.certiType,
    required this.fee,
    required this.updatedAt,
    required this.videoPlayerController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                            "Detail Sertifikasi",
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorStyles.black,
                            ),
                          ),
                          Text(
                            "Detail lengkap sertifikasi",
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
              videoPlayerController.value.isInitialized
                ? Column(
                  children: [
                    AspectRatio(
                        aspectRatio: videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(videoPlayerController),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              videoPlayerController.play();
                            }, 
                            child: Icon(Icons.play_arrow),
                          ),
                          SizedBox(width: 16,),
                          ElevatedButton(
                            onPressed: (){
                              videoPlayerController.pause();
                            }, 
                            child: Icon(Icons.pause),
                          ),
                        ],
                      ),
                  ],
                )
                : Container(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStyles.greyOutline, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(12),
                  height: 230,
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
                                    certiTitle,
                                    style: GoogleFonts.outfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyles.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        companyName,
                                        style: GoogleFonts.outfit(
                                          fontSize: 12,
                                          color: ColorStyles.greyText,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        " •",
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
                                  "${rating}  (${jmlPenilaian} Penilaian)",
                                  style: GoogleFonts.outfit(
                                    fontSize: 12,
                                    color: ColorStyles.greyText,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
