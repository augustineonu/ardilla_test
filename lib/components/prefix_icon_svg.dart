import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrefixIconSvg extends StatelessWidget {
  const PrefixIconSvg({super.key, required this.assetPath});
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: SvgPicture.asset(
        'assets/svg/$assetPath.svg',
        fit: BoxFit.contain,
        //  color: Colors.red,
        height: 16.h,
        width: 16.w,
      ),
    );
  }
}