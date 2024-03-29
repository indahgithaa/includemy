import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import '../widgets/chip_options.dart';
import '../widgets/buttons.dart';
import './pilih_tanggal_lahir.dart';
import 'package:get/get.dart';
import 'package:includemy/controller/register_controller.dart';

class DreamJobsPage extends StatefulWidget {
  const DreamJobsPage({super.key});

  @override
  State<DreamJobsPage> createState() => _DreamJobsPageState();
}

class _DreamJobsPageState extends State<DreamJobsPage> {
  final List<List<String>> jobList = [
    ["💻", "Administrasi"],
    ["🌐", "Entri Data"],
    ["🎨", "Desainer"],
    ["🎧", "Composer"],
    ["📹", "Videografi"],
    ["📷", "Fotografi"],
    ["🧔‍♀️", "Pengembang Web"],
    ["💵", "Keuangan"],
    ["📰", "Penulis Artikel"],
    ["📺", "Jurnalisme"],
    ["🌍", "Penerjemah Bahasa"],
    ["🔥", "Lainnya"],
  ];

  String userPreference = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            SvgPicture.asset('assets/logo.svg'),
            SizedBox(height: 16),
            Text(
              "Yuk, Pilih Pekerjaan Impianmu!",
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16,),
            Text(
              "Pilih beberapa minat pekerjaan yang sesuai dengan minat dan bidang kamu!",
              style: GoogleFonts.outfit(
                color: ColorStyles.greyText,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 32,),
            Container(
              height: 368,
              width: 400,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                textDirection: TextDirection.ltr,
                children: 
                  List.generate(
                    jobList.length,
                    (index) => GestureDetector(
                      child: ChipOptions(icon: jobList[index][0], job: jobList[index][1]),
                      onTap: (){
                        setState(() {
                          userPreference = jobList[index][1];
                        });
                      },
                    ),
                  ),
              ),
            ),
            SizedBox(height: 51,),
            Expanded(    
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Buttons(
                  text: "Isi Biodata", 
                  onClicked: (){
                    print(userPreference);
                    RegisterController.instance.updateRegistrationData(
                      preference: userPreference,
                    );
                    Get.to(PilihTanggalLahirPage());
                  },
                  width: MediaQuery.of(context).size.width, 
                  backgroundColor: ColorStyles.primary, 
                  fontColor: ColorStyles.white
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}