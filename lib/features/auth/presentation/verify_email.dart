import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30.sp, right: 30.sp, bottom: 50.sp),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.primaryColorDeep,
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                       ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrows.svg',
                        height: 259.h,
                        width: 356.w,
                      ),
                      Text(
                        'Verify your email address',
                        textAlign: TextAlign.center,
                        style: TextStyles.large.copyWith(
                            color: AppColors.primaryColorDeep,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Button(
                        title: 'Open Email App',
                        color: AppColors.appWhite,
                        borderColor: AppColors.primaryColor,
                        titleColor: AppColors.primaryColor,
                        onTap: () {},
                        width: width,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Button(
                        title: 'Continue',
                        color: AppColors.primaryColor,
                        titleColor: AppColors.appWhite,
                        onTap: () {
                          context.push(RoutePath.signUp);
                        },
                        width: width,
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
