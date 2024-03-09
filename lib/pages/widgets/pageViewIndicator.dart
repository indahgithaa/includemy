import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewIndicators extends StatefulWidget {
  final Color indicator1;
  final Color indicator2;
  final Color indicator3;

  const PageViewIndicators({
    Key? key,
    required this.indicator1,
    required this.indicator2,
    required this.indicator3
    });

  @override
  State<PageViewIndicators> createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicators> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.indicator1,
                borderRadius: BorderRadius.circular(8)
              ),
            )
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.indicator2,
                borderRadius: BorderRadius.circular(8)
              ),
            )
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: widget.indicator3,
                borderRadius: BorderRadius.circular(8)
              ),
            )
          ),
        ],
      ),
    );
  }
}