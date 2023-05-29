import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_config/app_styles/app_colors.dart';

class TripleSidebarWidget extends StatelessWidget {
  const TripleSidebarWidget({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 15.w),
            Text(title,
                style: TextStyles.small.copyWith(
                    color: AppColors.appWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp)),
          ],
        ),

        //  SizedBox(width: 15.w),
        Container(
          height: 23.h,
          width: 55.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.appWhite, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(13.r),
            ),
            //color: color ?? AppColors.primaryColor,
          ),
          child: Center(
            child: Text(
              'Coming Soon',
              style: TextStyle(
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
