import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/widgets/buttons.dart';
import 'package:includemy/app/styles/color_styles.dart';

class EkspektasiGajiBottomSheet extends StatefulWidget {
  final String jobTitle;
  const EkspektasiGajiBottomSheet({Key? key, required this.jobTitle}) : super(key: key);

  @override
  _EkspektasiGajiBottomSheetState createState() => _EkspektasiGajiBottomSheetState();
}

class _EkspektasiGajiBottomSheetState extends State<EkspektasiGajiBottomSheet> {
  String? _gajiMinimum;
  String? _gajiMaksimum;

  List<String> ekspektasiGaji = [
    "Rp500.000 - Rp1.000.000",
    "Rp1.000.000 - Rp2.000.000",
    "Rp2.000.000 - Rp3.000.000",
    "Rp3.000.000 - Rp4.000.000",
    "Rp4.000.000 - Rp5.000.000",
    "Rp5.000.000 - Rp6.000.000",
    "Rp6.000.000 - Rp7.000.000",
    "Rp7.000.000 - Rp8.000.000",
    "Rp8.000.000 - Rp9.000.000",
    "Rp9.000.000 - Rp10.000.000",
  ];

  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.white,
      ),
      height: 363,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lamar Posisi ${widget.jobTitle}",
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Icon(
                  Icons.close,
                  color: ColorStyles.greyText,
                  size: 20,
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: LinearProgressIndicator(
                    value: _currentSliderValue,
                    backgroundColor: ColorStyles.greyOutline,
                    valueColor: AlwaysStoppedAnimation<Color>(ColorStyles.primary),
                  ),
                ),
                Text(
                  "${(_currentSliderValue * 2).toInt()}/2",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.greyText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Text(
            "Ekspektasi Gaji Bulanan",
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorStyles.black,
            ),
          ),
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorStyles.greyOutline),
              borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            height: 44,
            child: Row(
              children: [
                Icon(
                  Icons.person_outline_outlined,
                  size: 16,
                  color: ColorStyles.greyText,
                ),
                SizedBox(width:10),
                Expanded(
                  child: DropdownButton<String>(
                  hint: Text("Gaji Minimal"),
                  value: _gajiMinimum,
                  onChanged: (newValue) {
                    setState(() {
                      _gajiMinimum = newValue;
                      _currentSliderValue = _gajiMaksimum != null ? 1 : 0.5;
                    });
                  },
                  items: ekspektasiGaji.map((String gaji) {
                    return DropdownMenuItem<String>(
                      value: gaji,
                      child: Text(gaji),
                    );
                  }).toList(),
                  isExpanded: true, 
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    color: ColorStyles.greyText,
                  ), 
                  underline: Container(), 
                  itemHeight: kMinInteractiveDimension,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Text(
            "Hingga",
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorStyles.greyText,
            )
          ),
          SizedBox(height: 16, ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorStyles.greyOutline),
              borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            height: 44,
            child: Row(
              children: [
                Icon(
                  Icons.person_outline_outlined,
                  size: 16,
                  color: ColorStyles.greyText,
                ),
                SizedBox(width:10),
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text("Gaji Maksimal"),
                    items: ekspektasiGaji.map((String gaji) {
                      return DropdownMenuItem<String>(
                        value: gaji,
                        child: Text(gaji),
                      );
                    }).toList(),
                    value: _gajiMaksimum,
                    onChanged: (String? newValue) {
                      setState(() {
                        _gajiMaksimum = newValue;
                        _currentSliderValue = _gajiMinimum != null ? 1 : 0.5;
                      });
                    },
                    isExpanded: true, 
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: ColorStyles.greyText,
                    ), 
                    underline: Container(), 
                    itemHeight: kMinInteractiveDimension,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Buttons(
            text: "Selanjutnya", 
            onClicked: (){

            }, 
            width: MediaQuery.of(context).size.width, 
            backgroundColor: ColorStyles.primary, 
            fontColor: ColorStyles.white
          ),
        ],
      ),
    );
  }
}
