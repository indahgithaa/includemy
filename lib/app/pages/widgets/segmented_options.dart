import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';

class SegmentedOption extends StatefulWidget {
  final String _userDisability = "";

  const SegmentedOption({Key? key,});

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
      width: MediaQuery.of(context).size.width,
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
                    print("disabilitas:" + _userDisability);
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
                  print("disabilitas:" + _userDisability);
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