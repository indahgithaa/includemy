import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/widgets/khusus_apply_job.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/search_fields.dart';
import './widgets/sertifikasi_card.dart';
import 'package:video_player/video_player.dart';
import './certi_detail_page.dart';
import './widgets/attachments.dart';
import './widgets/pekerjaan_card.dart';
import './widgets/floating_btn.dart';
import './job_detail_page.dart';

class ApplyJobPage extends StatefulWidget {
  const ApplyJobPage({super.key});

  @override
  State<ApplyJobPage> createState() => _ApplyJobPageState();
}

class _ApplyJobPageState extends State<ApplyJobPage> {
  List<List<String>> pekerjaanList = [
    ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago", "10", "1 - 50 Karyawan Tetap  • Konsultan Outsourcing", "Marketing, Business Analysis, Visualisasi", "Selamat datang di kesempatan berkarir yang menantang dan dinamis sebagai Staff Marketing Operational! Bergabunglah dengan tim kami yang berdedikasi untuk merancang dan menjalankan strategi pemasaran efektif. \n \n 🎯 Deskripsi Pekerjaan \n Pelaksanaan Pemasaran: Mengkoordinasikan dan melaksanakan kampanye pemasaran berbasis strategi yang telah ditetapkan."],
    ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago", "10", "1 - 50 Karyawan Tetap  • Konsultan Outsourcing", "Marketing, Business Analysis, Visualisasi", "Selamat datang di kesempatan berkarir yang menantang dan dinamis sebagai Staff Marketing Operational! Bergabunglah dengan tim kami yang berdedikasi untuk merancang dan menjalankan strategi pemasaran efektif. \n \n 🎯 Deskripsi Pekerjaan \n Pelaksanaan Pemasaran: Mengkoordinasikan dan melaksanakan kampanye pemasaran berbasis strategi yang telah ditetapkan."],
    ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago", "10", "1 - 50 Karyawan Tetap  • Konsultan Outsourcing", "Marketing, Business Analysis, Visualisasi", "Selamat datang di kesempatan berkarir yang menantang dan dinamis sebagai Staff Marketing Operational! Bergabunglah dengan tim kami yang berdedikasi untuk merancang dan menjalankan strategi pemasaran efektif. \n \n 🎯 Deskripsi Pekerjaan \n Pelaksanaan Pemasaran: Mengkoordinasikan dan melaksanakan kampanye pemasaran berbasis strategi yang telah ditetapkan."],
    ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago", "10", "1 - 50 Karyawan Tetap  • Konsultan Outsourcing", "Marketing, Business Analysis, Visualisasi", "Selamat datang di kesempatan berkarir yang menantang dan dinamis sebagai Staff Marketing Operational! Bergabunglah dengan tim kami yang berdedikasi untuk merancang dan menjalankan strategi pemasaran efektif. \n \n 🎯 Deskripsi Pekerjaan \n Pelaksanaan Pemasaran: Mengkoordinasikan dan melaksanakan kampanye pemasaran berbasis strategi yang telah ditetapkan."],
    ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago", "10", "1 - 50 Karyawan Tetap  • Konsultan Outsourcing", "Marketing, Business Analysis, Visualisasi", "Selamat datang di kesempatan berkarir yang menantang dan dinamis sebagai Staff Marketing Operational! Bergabunglah dengan tim kami yang berdedikasi untuk merancang dan menjalankan strategi pemasaran efektif. \n \n 🎯 Deskripsi Pekerjaan \n Pelaksanaan Pemasaran: Mengkoordinasikan dan melaksanakan kampanye pemasaran berbasis strategi yang telah ditetapkan."],
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DecoratedSliver(
            decoration: BoxDecoration(color: ColorStyles.white),
            sliver: SliverPadding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16,),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorStyles.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tab Lowongan Pekerjaan",
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.black,
                                ),
                              ),
                              Text(
                                "Cari kesempatanmu disini",
                                style: GoogleFonts.outfit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorStyles.greyText,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/notification.svg'),
                        ],
                      ),
                      SizedBox(height: 16),
                      SearchBars(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hari ini • ",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.greyText,
                      ),
                    ),
                    TextSpan(
                      text: "${pekerjaanList.length}",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.black,
                      ),
                    ),
                    TextSpan(
                      text: " lowongan baru",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorStyles.greyText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: ColorStyles.white,
            ),
            sliver:  SliverPadding(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
               sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: PekerjaanCards(
                          width: MediaQuery.of(context).size.width,
                          jobImage: pekerjaanList[index][0],
                          jobTitle: pekerjaanList[index][1],
                          companyName: pekerjaanList[index][2],
                          location: pekerjaanList[index][3],
                          salary: pekerjaanList[index][4],
                          jobType: pekerjaanList[index][5],
                          disabilitasType: pekerjaanList[index][6],
                          updatedAt: pekerjaanList[index][7],
                          onClicked: (){
                            print("hi");
                            Get.to(JobDetailPage(
                              jobImage: pekerjaanList[index][0],
                              jobTitle: pekerjaanList[index][1],
                              companyName: pekerjaanList[index][2],
                              location: pekerjaanList[index][3],
                              salary: pekerjaanList[index][4],
                              jobType: pekerjaanList[index][5],
                              disabilitasType: pekerjaanList[index][6],
                              updatedAt: pekerjaanList[index][7],
                              jmlPelamar: pekerjaanList[index][8],
                              companyInfo: pekerjaanList[index][9],
                              relatedField: pekerjaanList[index][10],
                              deskripsi: pekerjaanList[index][11],
                              )
                            );
                          },
                        ),
                      );
                    },
                    childCount: pekerjaanList.length,
                  ),
                ),
            ),
          ),
        ],
      )
    );
  }
}
