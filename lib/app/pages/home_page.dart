import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:includemy/app/pages/profil_user.dart';
import 'package:includemy/app/pages/sertifikasi_page.dart';
import 'package:includemy/app/styles/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:includemy/controller/user_controller.dart';
import 'package:includemy/model/user.dart';
import 'package:includemy/services/user_info_services.dart';
import 'package:includemy/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './widgets/search_fields.dart';
import 'widgets/khusus_apply_job.dart';
import './widgets/floating_btn.dart';
import './applyjob_page.dart';
import './widgets/pekerjaan_card.dart';
import './widgets/sertifikasi_card.dart';
import './connect_page.dart';
import './mentoring_page.dart';
import './applyjob_page.dart';
import './widgets/khusus_apply_job.dart';
import './widgets/khusus_sertifikasi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();
  final UserInfoServices _userInfoServices = UserInfoServices();
  final UserController userController = Get.put(UserController());
  User? userData;
  
  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }
  
  List<List<String>> pekerjaanList = [
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
   ["assets/job-img1.svg", "Staff Marketing Operational", "InkSpace", "Malang, Jawa Timur", "2.000k", "Full Time", "Tuna Daksa", "2hr ago"],
  ];

  List<List<String>> sertifikasiList = [
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
   ["assets/certi-img1.svg", "Certified Marketing", "InkSpace", "4.5", "100", "1 Bulan", "Marketing", "Sertifikasi", "Gratis", "2hr ago"],
  ];

  Future<void> fetchUserInfo() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token not found');
    }

    var _dio = Dio();
    final response = await _dio.get(
      Utils.baseUrl + '/user/profile/get-user',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    if (response.statusCode == 200) {
      print(response.data['data']);
      setState(() {
        userData = User.fromJson(response.data['data']);
        username = response.data['data']['name'];
        email = response.data['data']['email'];
      });
    } else {
      throw Exception('Failed to load user info');
    }
  } catch (e) {
    throw Exception('Failed to load user info: $e');
  }
}

  String username = 'Demo BCC';
  String email = 'demobcc@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              decoration: BoxDecoration(
                    color: ColorStyles.white,
                ),
                padding: EdgeInsets.only(top: 49, right: 16, left: 16, bottom: 16),
               child: Column(
                 children: [
                   Container(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfilUserPage(name: username, email: email)),
                            );
                          },
                          child: Row(
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
                                  //get username from shared preferences
                                  Text(
                                    "Hai, ${username}",
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
                        ),
                        SvgPicture.asset(
                          'assets/notification.svg',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                   ),
                   SizedBox(height: 16,),
                   SearchBars()
                 ],
               ),
             ),
            SizedBox(height: 16),
            // Carousel
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/carousel1.png',),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/carousel1.png',),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/carousel1.png',),
                        ),
                      ],
                    ),
                  ),
                  // Page indicator
                  Positioned(
                    bottom: 15.0,
                    child: Container(
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) => buildDot(index: index)),
                      ),
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              padding: EdgeInsets.only(top: 16, left: 16, bottom:16),
              child: Column(
                children: [
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
                            MaterialPageRoute(builder: (context) => KhususApplyJob()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Text(
                            "Lihat semua",
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: ColorStyles.greyText,
                            ),
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
                          width: 304,
                          jobImage: pekerjaanList[index][0],
                          jobTitle: pekerjaanList[index][1],
                          companyName: pekerjaanList[index][2],
                          location: pekerjaanList[index][3],
                          salary: pekerjaanList[index][4],
                          jobType: pekerjaanList[index][5],
                          disabilitasType: pekerjaanList[index][6],
                          updatedAt: pekerjaanList[index][7],
                          onClicked: (){},
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                color: ColorStyles.white,
              ),
              padding: EdgeInsets.only(top: 16, left: 16, bottom:16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rekomendasi Sertifikasi",
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
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KhususSertifikasi()),
                            );
                          },
                          child: Text(
                            "Lihat semua",
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: ColorStyles.greyText,
                            ),
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
                      itemCount: sertifikasiList.length,
                      separatorBuilder: (context, index) => SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return SertifikasiCards(
                          width: 343,
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
                          onClicked: (){},
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
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
