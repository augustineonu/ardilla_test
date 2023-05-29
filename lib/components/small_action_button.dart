import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_config/app_styles/app_colors.dart';


class SmallActionButton extends StatelessWidget {
  final bool isFilled;
  final String title;
  final VoidCallback onTap;
  final double width;

  const SmallActionButton(
      {Key? key,
        required this.isFilled,
        required this.title,
        required this.width,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40.0.h,
        width: width * 0.42,
        decoration: BoxDecoration(
            color: isFilled
                ? Colors.blueAccent
                : AppColors.appWhite.withOpacity(0.5),
            border: Border.all(color:Colors.blueAccent),
            borderRadius: BorderRadius.circular(56.0.r)),
        child: Center(
            child: Text(
              title,
              style: TextStyles.medium.copyWith(
                  color: isFilled ? AppColors.appWhite : Colors.blueAccent),
            )),
     ),
);
}
}