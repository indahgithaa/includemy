import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';

class ChipOptions extends StatefulWidget {
  final String icon;
  final String job;

  const ChipOptions({
    Key? key,
    required this.icon,
    required this.job,
  });

  @override
  State<ChipOptions> createState() => _ChipOptionsState();
}

class _ChipOptionsState extends State<ChipOptions> {
  var _jobIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
            onTap: () {           
              if (_jobIndex == 0) {
                setState(() {
                  _jobIndex = 1;
                });
              } else {
                setState(() {
                  _jobIndex = 0;
                });
              }
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _jobIndex == 0 ? ColorStyles.primary.withOpacity(0.05) : ColorStyles.white.withOpacity(0.05),
                  ),
                  child: Text(
                    widget.icon
                  ),
                ),
                SizedBox(width: 14,),
                Text(
                  widget.job,
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: _jobIndex == 0 ? ColorStyles.black : ColorStyles.white,
                  )
                )
              ],
            )
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _jobIndex == 0 ? ColorStyles.white : ColorStyles.selectionBlack,
            border: Border.all(
              color: _jobIndex == 0 ? ColorStyles.greyOutline : ColorStyles.selectionBlack,
            ),
          ),
    );
  }
}