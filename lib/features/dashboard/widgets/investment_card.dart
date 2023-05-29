import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_config/app_styles/text_styles.dart';
import '../data/models/models.dart';

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: investmentDataList.length,
              // onPageChanged: (int index) {
              //   setState(() {
              //     investmentCardIndex = index;
              //   });
              // },
              // shrinkWrap: true,
              // controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30.sp, vertical: 23.sp),
                    decoration: BoxDecoration(
                      // color: investmentDataList[index].color,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          //  transform: GradientRotation(pi/2),
                          colors: [
                            investmentDataList[index].topGradientColor,
                            investmentDataList[index].bottomGradientColor,
                          ]),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        investmentDataList[index].image,
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(investmentDataList[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyles.medium.copyWith(
                                color: AppColors.primaryColorDeep,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(investmentDataList[index].subTitle,
                            textAlign: TextAlign.center,
                            style: TextStyles.medium.copyWith(
                                color: AppColors.appLightGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp)),
                        SizedBox(
                          height: 8.h,
                        ),
                        investmentDataList[index].bottomWidget
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
