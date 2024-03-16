import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Attachments extends StatefulWidget {
  final double width;
  final String attachmentType;
  final String attachmentTitle;
  final String attachmentInfo;
  final VoidCallback onClicked;

  const Attachments({
    Key? key,
    required this.width,
    required this.attachmentType,
    required this.attachmentTitle,
    required this.attachmentInfo,
    required this.onClicked,
  });

  @override
  State<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  late String assetPath;
  
  @override
  void initState() {
    super.initState();
    if (widget.attachmentType == 'pdf') {
      assetPath = 'assets/pdf.svg';
    } else if (widget.attachmentType == 'telegram') {
      assetPath = 'assets/telegram.svg';
    } else if (widget.attachmentType == 'excel') {
      assetPath = 'assets/excel.svg';
    } else {
      assetPath = 'assets/gform.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClicked,
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyles.greyBg,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12),
        width: widget.width,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    assetPath,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.attachmentTitle,
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        widget.attachmentInfo,
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: ColorStyles.greyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: widget.attachmentType == 'pdf' ? true : false,
              child: Icon(
                Icons.download,
                color: ColorStyles.greyText,
                size: 12,
              )
            ),
          ]
        ),
      ),
    );
  }
}