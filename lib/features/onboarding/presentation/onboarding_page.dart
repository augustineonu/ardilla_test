import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../widgets.dart/build_dot.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Skip",
                    style: smallTextStyle(),
                  )
                ],
              ),
              // SizedBox(
              //   height: 77.sp,
              // ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/onborading_1.png",
                    // height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Lorem Ipsum Kip\n Antares Lorem',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'CabinetGrotesk',
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    """Lorem ipsum dolor sit amet consectetur. Congue eget\naliquet nullam velit volutpat in viverra. Amet integer\nurna ornare congue ultrices at.""",
                    textAlign: TextAlign.center,
                    style: TextStyles.small.copyWith(color: AppColors.appGrey),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => BuildDot(
                          currentIndex: currentIndex,
                          index: index,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        context.push(RoutePath.getStarted);
                      },
                      child: SvgPicture.asset('assets/svg/button.svg')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle smallTextStyle() {
    return TextStyle(
        fontFamily: 'CabinetGrotesk',
        fontSize: 16.sp,
        color: AppColors.primaryColor);
  }
}
