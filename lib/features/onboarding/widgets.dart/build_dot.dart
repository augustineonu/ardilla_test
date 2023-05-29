import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDot extends StatelessWidget {
  const BuildDot(
      {Key? key,
      required this.index,
      required this.currentIndex,
      this.mainWidth,
      this.elseWidth,
      this.height})
      : super(key: key);
  final int index;
  final int currentIndex;
  final double? mainWidth;
  final double? elseWidth;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 7.h,
      width: currentIndex == index ? mainWidth ?? 22.w : elseWidth ?? 8.0.w,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0.r),
        color: currentIndex == index
            ? AppColors.primaryColor
            : AppColors.appLightGrey,
      ),
    );
  }
}
