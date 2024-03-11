import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './widgets/search_fields.dart';
import './widgets/navigation_bar.dart';
import './widgets/floating_btn.dart';
import './applyjob_page.dart';
import './widgets/pekerjaan_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();

  List<List<String>> pekerjaanList = [
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/profile-default.svg',
                  width: 44,
                  height: 44, 
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hai, ${"username"}!",
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Bagaimana kabarmu hari ini?",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: ColorStyles.greyText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/notification.svg',
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 16, left: 16),
        decoration: BoxDecoration(
          color: ColorStyles.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 16,),
            SearchBars(),
            SizedBox(height: 32),
            // Carousel
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 140.0,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Image.asset('assets/carousel1.png'),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Image.asset('assets/carousel1.png'),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Image.asset('assets/carousel1.png'),
                      ),
                    ],
                  ),
                ),
                // Page indicator
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => buildDot(index: index)),
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rekomendasi Lowongan",
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Berdasar personalisasi",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        color: ColorStyles.greyText,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApplyJobPage()),
                    );
                  },
                  child: Text(
                    "Lihat semua",
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      color: ColorStyles.greyText,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 155,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: pekerjaanList.length,
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return PekerjaanCards(
                    jobImage: pekerjaanList[index][0],
                    jobTitle: pekerjaanList[index][1],
                    companyName: pekerjaanList[index][2],
                    location: pekerjaanList[index][3],
                    salary: pekerjaanList[index][4],
                    jobType: pekerjaanList[index][5],
                    disabilitasType: pekerjaanList[index][6],
                    updatedAt: pekerjaanList[index][7],
                  );
                },
              ),
            )
          ]
        ),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 4,
      width: 29,
      decoration: BoxDecoration(
        color: _currentPage == index ? ColorStyles.white : ColorStyles.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}