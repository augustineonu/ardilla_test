import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle small = TextStyle(
    fontFamily: 'CabinetGrotesk',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    //color: AppColors.appGrey
  );
  static TextStyle medium = TextStyle(
      fontFamily: 'CabinetGrotesk',
      fontSize: 22.sp,
      color: AppColors.primaryColor);
  static TextStyle large = TextStyle(
      fontFamily: 'CabinetGrotesk',
      fontSize: 36.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor);
  TextStyle smallText() {
    return TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.appGrey);
  }
}
