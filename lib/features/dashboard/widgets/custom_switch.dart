import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, this.color});
  final Color? color;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isUSDSelected = true;
  

  @override
  Widget build(BuildContext context) {

        final switchColor = widget.color ?? const Color(0xffC72864); // Use the provided color or set a default color

    return GestureDetector(
      onTap: () {
        setState(() {
          isUSDSelected = !isUSDSelected;
        });
      },
      child: Container(
        height: 22.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: switchColor,
          borderRadius: BorderRadius.circular(11.sp),
        ),
        child: Row(
          children: [
            Container(
              width: 30.w,
              height: 14.h,
              margin: EdgeInsets.only(left: 5.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isUSDSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Text(
                'NGN',
                style: TextStyle(
                  fontSize: 10.sp,
                  color:
                      isUSDSelected ? AppColors.primaryColorDeep : Colors.white,
                ),
              ),
            ),
            Container(
              width: 30.w,
              height: 14.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isUSDSelected ? Colors.transparent : Colors.white,
                borderRadius: BorderRadius.circular(11.sp),
              ),
              child: Text(
                'USD',
                style: TextStyle(
                  fontSize: 10.sp,
                  color:
                      isUSDSelected ? Colors.white : AppColors.primaryColorDeep,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
