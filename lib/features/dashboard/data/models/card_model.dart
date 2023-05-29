import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/widgets.dart';

class CardDataModel {
  final String title;
  final Widget? suffixTitle;
  final String currency;
  final String amount;
  final Widget eye;
  final Widget bottomWidget;
  final Color color;
  final Color gradientColor1;
  final Color gradientColor2;
  final String deocrationImage;

  CardDataModel(
      {required this.title,
      this.suffixTitle,
      required this.currency,
      required this.amount,
      required this.eye,
      required this.bottomWidget,
      required this.color,
      required this.gradientColor1,
      required this.gradientColor2,
      required this.deocrationImage});
}

List<CardDataModel> cardDataList = [
  CardDataModel(
    title: 'SAN',
    currency: 'USD',
    amount: '100',
    color: AppColors.primaryColor,
    gradientColor1: AppColors.primaryColor,
    gradientColor2: AppColors.primaryColor.withOpacity(0.8),
    eye: const Icon(Icons.visibility),
    deocrationImage: 'assets/images/cardIcon.png',
    bottomWidget: const SizedBox(),
  ),
  CardDataModel(
    color: AppColors.secondaryColor,
    gradientColor1: AppColors.secondaryColor,
    gradientColor2: AppColors.secondaryColor.withOpacity(0.8),
    title: 'Dilla Wallet',
    deocrationImage: 'assets/images/cardIcon1.png',
    currency: 'NGN',
    amount: '100,000.00',
    eye: const Icon(Icons.visibility),
    bottomWidget: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CustomSwitch(),
            SizedBox(
              width: 6.w,
            ),
            Text(
              '₦740 /\$1',
              style: TextStyles.small.copyWith(
                  color: AppColors.appWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp),
            ),
          ],
        ),
        Container(
          height: 35.h,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(90.r),
            ),
            color: AppColors.appWhite,
          ),
          child: Center(
            child: Text(
              "Add Money",
              style: TextStyles.small.copyWith(
                  color: AppColors.primaryColorDeep,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp),
            ),
          ),
        ),
      ],
    )),
  ),
  CardDataModel(
    title: 'Total Funds',
    currency: 'NGN',
    amount: '100,000.00',
    deocrationImage: 'assets/images/cardIcon1.png',
    color: AppColors.appWhite,
    gradientColor1: AppColors.appWhite,
    gradientColor2: AppColors.appWhite,
    eye: const Icon(Icons.visibility),
    bottomWidget: Container(
        child: Column(
      children: [
        const Text(
          "********",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Text('Generate Account Number',
                style: TextStyles.small.copyWith(
                    color: AppColors.appWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp)),
            SizedBox(
              width: 10.w,
            ),
            SvgPicture.asset('assets/svg/card_arrow.svg'),
          ],
        ),
      ],
    )),
  ),
];

List<Widget> cardWidgetList = [
  // 1
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 23.sp),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              //  transform: GradientRotation(pi/2),
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor.withOpacity(0.8),
              ]),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: const DecorationImage(
              image: AssetImage('assets/images/cardIcon.png'))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SAN',
              style: TextStyles.medium.copyWith(
                  color: AppColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp)),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("USD 100",
                  style: TextStyles.medium.copyWith(
                      color: AppColors.appWhite, fontWeight: FontWeight.w700)),
              SvgPicture.asset('assets/svg/eye_privacy.svg'),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "********",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text('Generate Account Number',
                      style: TextStyles.small.copyWith(
                          color: AppColors.appWhite,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp)),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset('assets/svg/card_arrow.svg')
                ],
              ),
            ],
          )),
        ],
      ),
    ),
  ),

  // 2
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 23.sp),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              //  transform: GradientRotation(pi/2),
              colors: [
                AppColors.secondaryColor,
                AppColors.secondaryColor.withOpacity(0.8),
              ]),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: const DecorationImage(
              image: AssetImage('assets/images/cardIcon1.png'))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dilla Wallet',
              style: TextStyles.medium.copyWith(
                  color: AppColors.appWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp)),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NGN 100,000.00",
                  style: TextStyles.medium.copyWith(
                      color: AppColors.appWhite,
                      fontWeight: FontWeight.w700)),
              SvgPicture.asset('assets/svg/eye_privacy.svg'),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomSwitch(),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    '₦740 /\$1',
                    style: TextStyles.small.copyWith(
                        color: AppColors.appWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp),
                  ),
                ],
              ),
              Container(
                height: 35.h,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(90.r),
                  ),
                  color: AppColors.appWhite,
                ),
                child: Center(
                  child: Text(
                    "Add Money",
                    style: TextStyles.small.copyWith(
                        color: AppColors.primaryColorDeep,
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    ),
  ),

  // 3
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 23.sp),
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        border: Border.all(color: const Color(0xffDCCFE7)),
        // gradient: LinearGradient(
        //     begin: Alignment.bottomLeft,
        //     end: Alignment.topRight,
        //     //  transform: GradientRotation(pi/2),
        //     colors: [
        //       AppColors.apwh,
        //       AppColors.primaryColor.withOpacity(0.8),
        //     ]
        //     ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        // image: const DecorationImage(
        //     image: AssetImage('assets/images/cardIcon.png'))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Funds',
              style: TextStyles.medium.copyWith(
                  color: AppColors.primaryColorDeep,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp)),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("NGN 100,000.00",
                  style: TextStyles.medium.copyWith(
                      color: AppColors.primaryColorDeep,
                      fontWeight: FontWeight.w700)),
              SvgPicture.asset(
                'assets/svg/eye_privacy.svg',
                color: const Color(0xff3D0072),
              ),
            ],
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            children: [
              const CustomSwitch(
                color: Color(0xffF9F9F9),
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                '₦740 /\$1',
                style: TextStyles.small.copyWith(
                    color: AppColors.appWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
];
