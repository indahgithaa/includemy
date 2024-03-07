import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingBtn extends StatefulWidget {
  const FloatingBtn({Key? key}) : super(key: key);

  @override
  State<FloatingBtn> createState() => _MyFloatingBtnState();
}

class _MyFloatingBtnState extends State<FloatingBtn> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorStyles.primary,
        elevation: 0.0,
        child: SvgPicture.asset('assets/work.svg')
      ),
    );
  }
}
