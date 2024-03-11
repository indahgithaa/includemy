import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SertifikasiCards extends StatefulWidget {
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

  const SertifikasiCards({
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
  });

  @override
  State<SertifikasiCards> createState() => _SertifikasiCardsState();
}

class _SertifikasiCardsState extends State<SertifikasiCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorStyles.greyOutline, width: 1)
      ),
      width: 343,
      height: 155,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            widget.certiImage,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 12),
          SizedBox(
            width: 271,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.certiTitle,
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
                      "Trusted",
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        color: ColorStyles.primary,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/star.svg'),
                    Text(
                      '${widget.rating} (${widget.jmlPenilaian} Penilaian)',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        color: ColorStyles.greyText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.duration,
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          color: ColorStyles.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: " training",
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ]
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
                            widget.relatedField,
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
                            widget.certiType,
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
                            widget.fee,
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
          )
        ],
      ),
    );
  }
}