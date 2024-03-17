import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import '../applyjob_page.dart';
import '../widgets/navigation_bar.dart';

class FloatingBtn extends StatelessWidget {
  const FloatingBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavigationBars()),
          );
        },
        backgroundColor: ColorStyles.primary,
        elevation: 0.0,
        child: SvgPicture.asset('assets/work.svg'),
      ),
    );
  }
}
