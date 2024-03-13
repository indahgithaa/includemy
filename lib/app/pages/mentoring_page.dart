import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/mentoring_card.dart';

class MentoringPage extends StatefulWidget {
  const MentoringPage({super.key});

  @override
  State<MentoringPage> createState() => _MentoringPageState();
}

class _MentoringPageState extends State<MentoringPage> {
  @override
  Widget build(BuildContext context) {
    return MentoringCards(
      width: MediaQuery.of(context).size.width, 
      programImage: 'assets/contoh-program-mentoring1.png', 
      mentoringName: 'Persiapan Karir Dengan CV', 
      mentoringField: 'CV & Resume', 
      rating: 4.9, 
      mentoringType: 'Persiapan Karir', 
      jumlahMateri: 3, 
      namaMentor: 'Millea Zaneta', 
      mentorImage: 'assets/contoh-mentor1.png',
    );
  }
}