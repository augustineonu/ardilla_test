import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickLinkContainer extends StatelessWidget {
  const QuickLinkContainer({
    super.key,
    required this.image,
    required this.color,
    required this.backgroundColor,
    required this.title,
  });
  final String image;
  final Color color;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            height: 58.h,
            width: 45.w,
            margin: EdgeInsets.symmetric(horizontal: 5.sp),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          ),
          Positioned(
              top: 0.sp,
              left: 0,
              right: 0,
              bottom: 5.sp,
              child: Container(
                height: 58.h,
                width: 45.w,
                // padding: EdgeInsets.only(
                //     left: 5.sp, right: 0.sp, top: 5.sp, bottom: 5.sp),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.r),
                  //image: DecorationImage(image: image)
                ),
                child: Transform.scale(
                  scale: 0.58,
                  child: SvgPicture.asset(
                    'assets/svg/$image.svg',
                    height: 30.h,
                  ),
                ),
              )),
        ]),
        SizedBox(
          height: 2.5.h,
        ),
        Text(
          title,
          style: TextStyles.small.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
