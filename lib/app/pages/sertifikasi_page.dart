import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import './widgets/search_fields.dart';
import './widgets/sertifikasi_card.dart';
import 'package:video_player/video_player.dart';
import './certi_detail_page.dart';
import './widgets/attachments.dart';

class SertifikasiPage extends StatefulWidget {
  const SertifikasiPage({super.key});

  @override
  State<SertifikasiPage> createState() => _SertifikasiPageState();
}

class _SertifikasiPageState extends State<SertifikasiPage> {
  List<List<String>> sertifikasiList = [
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago", "17", "Keahlian Data Entry", "Visualisasi Data, Analisis, Statistika", "Selamat datang di halaman Sertifikasi Data Analyst, wadah tempat Anda dapat mengukir jejak sebagai ahli analisis data dalam industri yang terus berkembang. \n 🎯 Apa yang Anda Akan Pelajari? \n Teknik Pengumpulan Data: Ini mencakup teknik dan praktek dalam mengumpulkan data dari berbagai sumber serta proses pembersihan data untuk memastikan keakuratannya. \n Analisis Statistik: Pada tahap ini, peserta belajar konsep dasar statistik yang relevan dengan analisis data. Ini termasuk pengenalan metode statistik untuk merumuskan hipotesis dan mengambil keputusan.", "3", "Modul Video dan Konsultasi"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago", "17", "Keahlian Data Entry", "Visualisasi Data, Analisis, Statistika", "Selamat datang di halaman Sertifikasi Data Analyst, wadah tempat Anda dapat mengukir jejak sebagai ahli analisis data dalam industri yang terus berkembang. \n 🎯 Apa yang Anda Akan Pelajari? \n Teknik Pengumpulan Data: Ini mencakup teknik dan praktek dalam mengumpulkan data dari berbagai sumber serta proses pembersihan data untuk memastikan keakuratannya. \n Analisis Statistik: Pada tahap ini, peserta belajar konsep dasar statistik yang relevan dengan analisis data. Ini termasuk pengenalan metode statistik untuk merumuskan hipotesis dan mengambil keputusan.", "3", "Modul Video dan Konsultasi"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago", "17", "Keahlian Data Entry", "Visualisasi Data, Analisis, Statistika", "Selamat datang di halaman Sertifikasi Data Analyst, wadah tempat Anda dapat mengukir jejak sebagai ahli analisis data dalam industri yang terus berkembang. \n 🎯 Apa yang Anda Akan Pelajari? \n Teknik Pengumpulan Data: Ini mencakup teknik dan praktek dalam mengumpulkan data dari berbagai sumber serta proses pembersihan data untuk memastikan keakuratannya. \n Analisis Statistik: Pada tahap ini, peserta belajar konsep dasar statistik yang relevan dengan analisis data. Ini termasuk pengenalan metode statistik untuk merumuskan hipotesis dan mengambil keputusan.", "3", "Modul Video dan Konsultasi"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago", "17", "Keahlian Data Entry", "Visualisasi Data, Analisis, Statistika", "Selamat datang di halaman Sertifikasi Data Analyst, wadah tempat Anda dapat mengukir jejak sebagai ahli analisis data dalam industri yang terus berkembang. \n 🎯 Apa yang Anda Akan Pelajari? \n Teknik Pengumpulan Data: Ini mencakup teknik dan praktek dalam mengumpulkan data dari berbagai sumber serta proses pembersihan data untuk memastikan keakuratannya. \n Analisis Statistik: Pada tahap ini, peserta belajar konsep dasar statistik yang relevan dengan analisis data. Ini termasuk pengenalan metode statistik untuk merumuskan hipotesis dan mengambil keputusan.", "3", "Modul Video dan Konsultasi"],
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
                                "Tab Sertifikasi",
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorStyles.black,
                                ),
                              ),
                              Text(
                                "Cari minat & bakatmu disini",
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
                      text: "${sertifikasiList.length}",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorStyles.black,
                      ),
                    ),
                    TextSpan(
                      text: " Sertifikasi baru",
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
                        child: SertifikasiCards(
                          width: MediaQuery.of(context).size.width,
                          certiImage: sertifikasiList[index][0],
                          certiTitle: sertifikasiList[index][1],
                          companyName: sertifikasiList[index][2],
                          rating: sertifikasiList[index][3],
                          jmlPenilaian: sertifikasiList[index][4],
                          duration: sertifikasiList[index][5],
                          relatedField: sertifikasiList[index][6],
                          certiType: sertifikasiList[index][7],
                          fee: sertifikasiList[index][8],
                          updatedAt: sertifikasiList[index][9],
                          onClicked: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => DetailSertificatePage(
                                  certiImage: sertifikasiList[index][0],
                                  certiTitle: sertifikasiList[index][1],
                                  companyName: sertifikasiList[index][2],
                                  rating: sertifikasiList[index][3],
                                  jmlPenilaian: sertifikasiList[index][4],
                                  duration: sertifikasiList[index][5],
                                  relatedField: sertifikasiList[index][6],
                                  certiType: sertifikasiList[index][7],
                                  fee: sertifikasiList[index][8],
                                  updatedAt: sertifikasiList[index][9],
                                  peserta: sertifikasiList[index][10],
                                  keahlian: sertifikasiList[index][11],
                                  tags: sertifikasiList[index][12],
                                  deskripsi: sertifikasiList[index][13],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    childCount: sertifikasiList.length,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
