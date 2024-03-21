import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './widgets/video_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/attachments.dart';
import './widgets/buttons.dart';
import './widgets/bottom_sheet.dart';

class JobDetailPage extends StatefulWidget {
  final String jobImage;
  final String jobTitle;
  final String companyName;
  final String location;
  final String salary;
  final String jmlPelamar; 
  final String companyInfo; 
  final String relatedField; 
  final String jobType;
  final String disabilitasType;
  final String updatedAt;
  final String deskripsi;

  const JobDetailPage({
    Key? key,
    required this.jobImage,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.jmlPelamar,
    required this.companyInfo,
    required this.relatedField,
    required this.jobType,
    required this.disabilitasType,
    required this.updatedAt,
    required this.deskripsi,
  });

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

List<List<String>> panduanAttachments = [
  ["pdf", "Panduan Pendaftaran.pdf", "4.27 MB",],
];

class _JobDetailPageState extends State<JobDetailPage> {
  int currentTab = 0;
  String? _gajiMinimum;
  String? _gajiMaksimum;

  List<String> ekspektasiGaji = [
    "Rp500.000 - Rp1.000.000",
    "Rp1.000.000 - Rp2.000.000",
    "Rp2.000.000 - Rp3.000.000",
    "Rp3.000.000 - Rp4.000.000",
    "Rp4.000.000 - Rp5.000.000",
    "Rp5.000.000 - Rp6.000.000",
    "Rp6.000.000 - Rp7.000.000",
    "Rp7.000.000 - Rp8.000.000",
    "Rp8.000.000 - Rp9.000.000",
    "Rp9.000.000 - Rp10.000.000",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
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
                          "Detail Pekerjaan",
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorStyles.black,
                          ),
                        ),
                        Text(
                          "Detail lengkap pekerjaan",
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles.greyOutline, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(widget.jobImage, height: 56,),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.jobTitle,
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.companyName,
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
                            Text(
                              widget.location,
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                color: ColorStyles.greyText,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Rp",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: ColorStyles.greyText,
                            ),
                          ),
                          TextSpan(
                            text: widget.salary,
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              color: ColorStyles.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "/bulan",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: ColorStyles.greyText,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline_outlined,
                          size: 20,
                          color: ColorStyles.greyText,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "${widget.jmlPelamar} Pelamar",
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: ColorStyles.greyText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/kantor.svg'),
                        SizedBox(width: 8),
                        Text(
                          widget.companyInfo,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: ColorStyles.greyText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/graph.svg', height: 20,),
                        SizedBox(width: 8),
                        Text(
                          widget.relatedField,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: ColorStyles.greyText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorStyles.greyOutline, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.jobType,
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  color: ColorStyles.greyText,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorStyles.greyOutline, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.disabilitasType,
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  color: ColorStyles.greyText,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.updatedAt,
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
                                        fontSize: 16,
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
                                fontSize: 16,
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
                                    width: 68,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Tautan",
                                      style: GoogleFonts.outfit(
                                        fontSize: 16,
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
                        child: currentTab == 0 ? teksTentang() : widgetTautan(),
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
          text: "Lamar", 
          onClicked: (){
            showModalBottomSheet(
              context: context, 
              builder: (context){
                return MyBottomSheetContent(
                  jobTitle: widget.jobTitle,
                );
              }
            );
          }, 
          width: MediaQuery.of(context).size.width, 
          backgroundColor: ColorStyles.primary, 
          fontColor: ColorStyles.white,
        ),
      )
    );
  }

  Widget teksTentang(){
    return Expanded(
      child: Text(
        widget.deskripsi,
        style: GoogleFonts.outfit(
          fontSize: 14,
          color: ColorStyles.greyText,
        ),
      ),
    );
  }

  Widget widgetTautan(){
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