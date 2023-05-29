import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inflowDot extends StatelessWidget {
  const inflowDot({super.key, this.icon, required this.color});
  final Widget? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 12.w,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: icon ??
            Icon(
              Icons.check,
              color: Colors.white,
              size: 8.sp,
            ),
      ),
    );
  }
}
