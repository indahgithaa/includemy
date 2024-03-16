import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MentoringCards extends StatefulWidget {
  final double width;
  final String programImage;
  final String mentoringName;
  final String mentoringField;
  final String rating;
  final String mentoringType;
  final String jumlahMateri;
  final String namaMentor;
  final String mentorImage;
  
  const MentoringCards({
    Key? key,
    required this.width,
    required this.programImage,
    required this.mentoringName,
    required this.mentoringField,
    required this.rating,
    required this.mentoringType,
    required this.jumlahMateri,
    required this.namaMentor,
    required this.mentorImage,
  });

  @override
  State<MentoringCards> createState() => _MentoringCardsState();
}

class _MentoringCardsState extends State<MentoringCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 140,
      child: Row(
        children: [
          Image.asset('${widget.programImage}', width: 140, height: 140,),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        widget.mentoringField,
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.primary,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: ColorStyles.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/star.svg',),
                          Text(
                            widget.rating,
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: ColorStyles.greyText,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  widget.mentoringName,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorStyles.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/category.svg'),
                          Text(
                            widget.mentoringType,
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: ColorStyles.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/book.svg'),
                          Text(
                            widget.jumlahMateri + " Materi",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: ColorStyles.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 38,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage('${widget.mentorImage}',),
                        ),
                        SizedBox(width: 4),
                        Text(
                          widget.namaMentor,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: ColorStyles.greyText,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset('assets/bookmark.svg'),
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