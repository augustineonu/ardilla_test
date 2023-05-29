import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../app_config/app_styles/app_colors.dart';

class ProductLevelModel {
  final String title;
  final String subTitle;

  final Widget bottomWidget;
  final Color? color;
  final Color topGradientColor;
  final Color bottomGradientColor;
  final Widget image;

  ProductLevelModel(
      {required this.title,
      required this.subTitle,
      required this.bottomWidget,
      required this.color,
      required this.topGradientColor,
      required this.bottomGradientColor,
      required this.image});
}

List<Widget> productLevelWidgetList = [
  // 1
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Rank",
          style: TextStyles.large.copyWith(
              color: AppColors.primaryColorDeep,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp)),
      SizedBox(
        height: 20.h,
      ),
      Container(
        width: 350.w,
        height: 170.h,
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        decoration: BoxDecoration(
            // color: const Color(0xffFEF6F8),
            color: const Color(0xffF0F0FF),
            borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cadet",
                        style: TextStyles.small.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Move up your Rank by completing\ntransactions",
                        style: TextStyles.small.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp)),
                  ],
                ),
                // Container(
                //   height: 120,
                //   width: 100,
                //   color: Colors.red,
                // )
                SvgPicture.asset(
                  'assets/svg/rank.svg',
                  fit: BoxFit.contain,
                  height: 100.h,
                  width: 60.w,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
  // 2
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Badges",
          style: TextStyles.large.copyWith(
              color: AppColors.primaryColorDeep,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp)),
      SizedBox(
        height: 20.h,
      ),
      Stack(
        children: [
          Container(
            width: 330.w,
            height: 170.h,
            padding: EdgeInsets.only(left: 16.sp, bottom: 10.sp, right: 16.sp),
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.r),
                ),
                image: const DecorationImage(
                    image: AssetImage('assets/images/badges_background.png'))),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Beginner",
                              style: TextStyles.small.copyWith(
                                  color: AppColors.primaryColorDeep,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("Move up your Badge by completing transactions",
                              style: TextStyles.small.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 22.sp,
            top: 0.sp,
            child: ClipRect(
              child: SvgPicture.asset(
                'assets/svg/badge.svg',
                height: 120.h,
                width: 40.w,
              ),
            ),
          ),
          Positioned(
            bottom: 15.sp,
            left: 20.sp,
            child: ClipRect(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/trophy.svg',
                    height: 25.h,
                    width: 25.w,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text("Super Saver",
                      style: TextStyles.small.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 8.sp)),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),

  // 3
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Referrals",
          style: TextStyles.large.copyWith(
              color: AppColors.primaryColorDeep,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp)),
      SizedBox(
        height: 20.h,
      ),
      Stack(
        children: [
          Container(
            width: 330.w,
            height: 170.h,
            padding: EdgeInsets.only(top: 25.sp, left: 15.sp, bottom: 35.sp),
            decoration: BoxDecoration(
                color: const Color(0xfffe5e5e5),
                borderRadius: BorderRadius.all(Radius.circular(7.r))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Refer & Earn",
                          style: TextStyles.large.copyWith(
                              color: AppColors.primaryColorDeep,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp)),
                      SizedBox(height: 5.h),
                      Text("Invite using your Kode Hex.",
                          style: TextStyles.large.copyWith(
                              color: AppColors.primaryColorDeep,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Click here",
                          style: TextStyles.large.copyWith(
                              color: AppColors.primaryColorDeep,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow_forward.svg',
                      )
                    ],
                  ),
                ]),
          ),
          Positioned(
              right: 0.sp,
              bottom: 0.sp,
              child: ClipRect(
                child: SvgPicture.asset(
                  'assets/svg/Coin.svg',
                  height: 120.h,
                  width: 120.h,
                ),
              ))
        ],
      ),
    ],
  ),
  // 4
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Money Wise",
          style: TextStyles.large.copyWith(
              color: AppColors.primaryColorDeep,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp)),
      SizedBox(
        height: 20.h,
      ),
      Stack(
        children: [
          Container(
            width: 330.w,
            height: 170.h,
            padding: EdgeInsets.only(top: 25.sp, left: 15.sp, bottom: 25.sp),
            decoration: BoxDecoration(
                color: const Color(0xfffe5e5e5),
                borderRadius: BorderRadius.all(Radius.circular(7.r))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Financial nuggets",
                          style: TextStyles.large.copyWith(
                              color: AppColors.primaryColorDeep,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp)),
                      SizedBox(height: 5.h),
                      Text(
                          "Take a step towards financial literacy with\nfinancial advice from the best minds\nin the game.",
                          textAlign: TextAlign.start,
                          style: TextStyles.large.copyWith(
                              color: AppColors.primaryColorDeep,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Click here",
                          style: TextStyles.large.copyWith(
                              color: AppColors.primaryColorDeep,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow_forward.svg',
                      )
                    ],
                  ),
                ]),
          ),
          Positioned(
              right: 0.sp,
              bottom: 0.sp,
              child: ClipRect(
                child: SvgPicture.asset(
                  'assets/svg/money_wise.svg',
                  height: 95.h,
                  width: 80.h,
                ),
              ))
        ],
      ),
    ],
  ),
];
