import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvestmentModel {
  final String title;
  final String subTitle;

  final Widget bottomWidget;
  final Color? color;
  final Color topGradientColor;
  final Color bottomGradientColor;
  final Widget image;

  InvestmentModel(
      {required this.title,
      required this.subTitle,
      required this.bottomWidget,
      required this.color,
      required this.topGradientColor,
      required this.bottomGradientColor,
      required this.image});
}

List<InvestmentModel> investmentDataList = [
  InvestmentModel(
    title: 'Unprecedented access to\ninvestment opportunities',
    subTitle: '20% Monthly ROI',
    color: AppColors.primaryColor,
    // topGradientColor: AppColors.primaryColor,
    topGradientColor: const Color(0xffEBE1F4),
    // bottomGradientColor: AppColors.primaryColor.withOpacity(0.8),
    bottomGradientColor: Colors.white,
    image: SvgPicture.asset('assets/svg/investment1.svg'),
    bottomWidget: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Start Investing',
          style: TextStyles.small.copyWith(
              color: AppColors.primaryColorDeep,
              fontWeight: FontWeight.w500,
              fontSize: 11.sp),
        ),
        SizedBox(
          width: 10.w,
        ),
        SvgPicture.asset('assets/svg/arrow_forward.svg'),
      ],
    ),
  ),
  // 2
  InvestmentModel(
    color: AppColors.secondaryColor,
    topGradientColor: const Color(0xffDBECE6),
    bottomGradientColor: Colors.white,
    title: 'Build your savings the right way',
    image: SvgPicture.asset('assets/svg/jar1.svg'),
    subTitle: '12% annual  ROI',
    bottomWidget: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Start Investing',
            style: TextStyles.small.copyWith(
                color: AppColors.primaryColorDeep,
                fontWeight: FontWeight.w500,
                fontSize: 11.sp)),
        SizedBox(
          width: 10.w,
        ),
        SvgPicture.asset('assets/svg/arrow_forward.svg'),
      ],
    ),
  ),
  InvestmentModel(
    title: 'Total Funds',
    subTitle: '12% Annual  ROI',
    image: Image.asset('assets/images/Shield.png'),
    color: AppColors.appWhite,
    topGradientColor: const Color(0xffF5F3F4),
    bottomGradientColor: AppColors.appWhite,
    bottomWidget: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Make youe first claim',
            style: TextStyles.small.copyWith(
                color: AppColors.primaryColorDeep,
                fontWeight: FontWeight.w500,
                fontSize: 11.sp)),
        SizedBox(
          width: 10.w,
        ),
        SvgPicture.asset('assets/svg/arrow_forward.svg'),
      ],
    ),
  ),
];
