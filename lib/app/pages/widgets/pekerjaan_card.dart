import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PekerjaanCards extends StatefulWidget {
  final double width;
  final String jobImage;
  final String jobTitle;
  final String companyName;
  final String location;
  final String salary;
  final String jobType;
  final String disabilitasType;
  final String updatedAt;
  final VoidCallback onClicked;

  const PekerjaanCards({
    Key? key,
    required this.width,
    required this.jobImage,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.salary,
    required this.jobType,
    required this.disabilitasType,
    required this.updatedAt,
    required this.onClicked,
  });

  @override
  State<PekerjaanCards> createState() => _PekerjaanCardsState();
}

class _PekerjaanCardsState extends State<PekerjaanCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClicked,
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 12, right: 12),
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorStyles.greyOutline, width: 1)
        ),
        width: widget.width,
        height: 155,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              widget.jobImage,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.jobTitle,
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black,
                        ),
                      ),
                      SvgPicture.asset('assets/bookmark.svg'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.companyName,
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.greyText,
                        ),
                      ),
                      Text(' ·'),
                      SvgPicture.asset('assets/verified.svg'),
                      Text(
                        "Verified",
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.primary,
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.location,
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      color: ColorStyles.greyText,
                    ),
                  ),
                  SizedBox(height: 16,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Rp",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: ColorStyles.greyText,
                          ),
                        ),
                        TextSpan(
                          text: widget.salary,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: ColorStyles.black,
                          ),
                        ),
                        TextSpan(
                          text: "/bulan",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: ColorStyles.greyText,
                          ),
                        )
                      ],
                    ),
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
                          fontSize: 14,
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
    );
  }
}