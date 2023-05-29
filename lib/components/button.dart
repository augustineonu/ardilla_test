import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      this.height,
      required this.width,
      required this.onTap,
      this.radius,
      this.color,
      this.isLoading,
      this.borderColor,
      this.titleColor,
      this.isIconVisible,
      this.icon});

  final String title;
  final double? height;
  final double width;
  final Function() onTap;
  final BorderRadius? radius;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;
  final bool? isLoading;
  final bool? isIconVisible;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Container(
            height: 45.h,
            width: width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(60),
              ),
              color: color ?? AppColors.primaryColor,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 0,
              //     blurRadius: 3,
              //     offset: const Offset(0, 4), // changes position of shadow
              //   ),
              // ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25.sp,
                    width: 25.sp,
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 45.h,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor ?? AppColors.grey200),
                borderRadius: BorderRadius.all(
                  Radius.circular(90.r),
                ),
                color: color ?? AppColors.primaryColor,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 0,
                //     blurRadius: 3,
                //     offset: const Offset(0, 4), // changes position of shadow
                //   ),
                // ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(visible: isIconVisible ?? false, child: icon ?? SizedBox()),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: titleColor ?? Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
