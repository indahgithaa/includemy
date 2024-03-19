import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './widgets/video_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/attachments.dart';
import './widgets/buttons.dart';

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
  });

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(widget.jobImage),
                        Column(
                          children: [
                            Text(
                              widget.jobTitle,
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorStyles.black,
                              ),
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}