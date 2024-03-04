import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';

class SegmentedOption extends StatefulWidget {
  const SegmentedOption({super.key});

  @override
  State<SegmentedOption> createState() => _SegmentedOptionState();
}

class _SegmentedOptionState extends State<SegmentedOption> {
  String _userDisability = '';
  var _choiceIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.greyBg,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 343,
      height: 52,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_choiceIndex != 0) {
                  setState(() {
                    _choiceIndex = 0;
                    _userDisability = "Tuna Rungu";
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _choiceIndex == 0 ? ColorStyles.white : ColorStyles.greyBg,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Tuna Rungu",
                  style: GoogleFonts.outfit(
                    color: _choiceIndex == 0 ? ColorStyles.black : ColorStyles.greyText,
                    fontSize: 14,
                  ),
                ),
              )
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_choiceIndex != 1) {
                  setState(() {
                    _choiceIndex = 1;
                    _userDisability = "Tuna Daksa";
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _choiceIndex == 1 ? ColorStyles.white :  ColorStyles.greyBg,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Tuna Daksa",
                  style: GoogleFonts.outfit(
                    color: _choiceIndex == 1 ? ColorStyles.black : ColorStyles.greyText,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}