import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/features/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InflowContainer extends StatelessWidget {
  const InflowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      width: 365.w,
      margin: EdgeInsets.symmetric(horizontal: 30.sp),
      padding:
          EdgeInsets.only(left: 20.sp, top: 10.sp, bottom: 10.sp),
      decoration: const BoxDecoration(
        color: Color(0xffF9F9F9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    "80%",
                    style: TextStyles.large.copyWith(
                        color: AppColors.grey500,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp),
                  ),
                  Row(
                    children: [
                      Text(
                        "Complete KYC",
                        style: TextStyles.small.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 8.sp,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SvgPicture.asset('assets/svg/progress.svg')
                ],
              ),
              SizedBox(width: 10.w),
              Container(
                height: 30.h,
                width: 1,
                color: AppColors.grey200,
                // color: Colors.red,
                // child: Container(
                //   color: Colors.red,
                // ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/arrow_up.svg',
                    height: 7.h,
                  ),
                  Text("10.00%",
                      style: TextStyles.small.copyWith(
                          color: AppColors.appGreen,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp)),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text("Cashflow",
                      style: TextStyles.small.copyWith(
                          color: AppColors.primaryColorDeep,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp)),
                ],
              ),
              //SizedBox(height: 12.h),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/chart.svg',
                    width: 180.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          inflowDot(
                            color: AppColors.secondaryColor,
                          ),
                          SizedBox(width: 3.w),
                          Text("Inflow",
                              style: TextStyles.small.copyWith(
                                  color: AppColors.primaryColorDeep,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp)),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Row(
                        children: [
                          inflowDot(
                            color: AppColors.primaryColor,
                            icon: const SizedBox(),
                          ),
                          Text("Outflow",
                              style: TextStyles.small.copyWith(
                                  color: AppColors.primaryColorDeep,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
