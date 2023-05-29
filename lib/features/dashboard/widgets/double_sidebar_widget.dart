import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoubleSidebarWidget extends StatelessWidget {
  const DoubleSidebarWidget({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(width: 15.w),
        Text(title,
            style: TextStyles.small.copyWith(
                color: AppColors.appWhite,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp)),
      ],
    );
  }
}
