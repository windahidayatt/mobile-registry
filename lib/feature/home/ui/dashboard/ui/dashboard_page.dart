import 'package:flutter/material.dart';
import 'package:mobile_registry/gen/assets.gen.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTone.reWhite,
      body: Container(
        padding: EdgeInsets.all(2.w),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Summary',
                    style: TextStyle(
                        color: ColorTone.reDarkGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Overall data',
                    style:
                        TextStyle(color: ColorTone.reDarkGrey, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    color: ColorTone.reWhite,
                    shadowColor: ColorTone.reLightBlack,
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Total Operative',
                                  style: TextStyle(
                                      color: ColorTone.reDarkGrey,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  '121',
                                  style: TextStyle(
                                      color: ColorTone.reDarkGrey,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.bar_chart,
                              size: 36,
                              color: ColorTone.reDarkGrey,
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    color: ColorTone.reWhite,
                    shadowColor: ColorTone.reLightBlack,
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Total Patient',
                                  style: TextStyle(
                                      color: ColorTone.reDarkGrey,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  '255',
                                  style: TextStyle(
                                      color: ColorTone.reDarkGrey,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.people,
                              size: 36,
                              color: ColorTone.reDarkGrey,
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                'Mobile Registry App',
                style: TextStyle(
                    color: ColorTone.reDarkGrey,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Image.asset(
                    Assets.image.main.splashMainImage.path,
                    width: 120,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Expanded(
                    child: Text(
                      'Aplikasi Mobile yang dikembangkan untuk membantu pengelolaan data pasien Elbow & Shoulders. Aplikasi ini dapat digunakan oleh Petugas Rumah Sakit. Daftar fitur yang dimiliki oleh aplikasi diantaranya : Pengelolaan pasien, dan operative operation.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: ColorTone.reDarkGrey, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  const Text(
                    '-',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: ColorTone.reDarkGrey, fontSize: 14.0),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    height: 20.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.image.main.inases,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.image.main.unpad,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.image.main.orthopaedi,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
