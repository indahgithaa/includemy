// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:includemy/app/pages/sertifikasi_page.dart';
// import 'package:includemy/app/styles/color_styles.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class JoyStickWidget extends StatefulWidget {
//   final int currentWidget;

//   const JoyStickWidget({
//     Key? key,
//     required this.currentWidget,
//   });

//   @override
//   State<JoyStickWidget> createState() => _JoyStickWidgetState();
// }

// class _JoyStickWidgetState extends State<JoyStickWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 224,
//       height: 80,
//       decoration: BoxDecoration(
//         color: Color(0xFF252525),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: ColorStyles.greyText.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(16),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 currentWidget--;
//               });
//             },
//             child: Container(
//               width: 48,
//               height: 48,
//               decoration: BoxDecoration(
//                 color: Color(0xFF363636),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(left: 8),
//                     child: Icon(
//                       Icons.arrow_back_ios,
//                       color: ColorStyles.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 24),
//           SvgPicture.asset('assets/middlebuttonjoystick.svg'),
//           SizedBox(width: 24),
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               color: Color(0xFF363636),
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   color: ColorStyles.white,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }