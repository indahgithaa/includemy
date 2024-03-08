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
  }) : super(key: key);

  @override
  State<ChipOptions> createState() => _ChipOptionsState();
}

class _ChipOptionsState extends State<ChipOptions> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _isSelected ? ColorStyles.selectionBlack : ColorStyles.white,
        border: Border.all(
          color: _isSelected ? ColorStyles.selectionBlack : ColorStyles.greyOutline,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: _isSelected ? ColorStyles.white.withOpacity(0.16) : ColorStyles.primary.withOpacity(0.05),
              ),
              child: Text(
                widget.icon,
              ),
            ),
            SizedBox(width: 14,),
            Text(
              widget.job,
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: _isSelected ? ColorStyles.white : ColorStyles.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
