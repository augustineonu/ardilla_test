import 'package:another_flushbar/flushbar.dart';
import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/components/small_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// Export package to avoid re-import for parsed arguments
export 'package:another_flushbar/flushbar.dart';

class Display {
  // On Process Failed
  static Flushbar<dynamic> onCompletedFlushBar(
      {required String title,
      required String message,
      VoidCallback? onDisplayCompleted,
      FlushbarPosition? position = FlushbarPosition.BOTTOM,
      required BuildContext context}) {
    return Flushbar(
      backgroundColor: AppColors.appGreen,
      title: title,
      isDismissible: true,
      message: message,
      flushbarPosition: position!,
      duration: Duration(seconds: 2),
    )..show(context).then((value) {
        if (onDisplayCompleted != null) {
          onDisplayCompleted!();
        }
      });
  }

  // On Process Completed Successfully
  static Flushbar<dynamic> onProcessFailed(
      {required String title,
      required String message,
      VoidCallback? onDisplayCompleted,
      FlushbarPosition? position = FlushbarPosition.BOTTOM,
      required BuildContext context}) {
    return Flushbar(
      backgroundColor: Colors.red,
      title: title,
      isDismissible: true,
      message: message,
      flushbarPosition: position!,
      duration: Duration(seconds: 2),
    )..show(context).then((value) {
        if (onDisplayCompleted != null) {
          onDisplayCompleted!();
        }
      });
  }

  // Show message

  static Flushbar<dynamic> showMessage(
      {Color? color,
      required String message,
      FlushbarPosition? position = FlushbarPosition.TOP,
      required BuildContext context}) {
    return Flushbar(
      backgroundColor: color!,
      //title: title,
      isDismissible: true,
      message: message,
      flushbarPosition: position!,
      duration: Duration(seconds: 2),
    )..show(context);
  }

    /// Non Dismissible Loading Barrier
  static Future<void> buildingLoadingBarrier({
    required BuildContext context,
    required double height,
  }) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.appWhite.withOpacity(0.9),
            insetPadding: EdgeInsets.all(24.0.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            content: Container(
              height: height * 0.23,
              padding: EdgeInsets.all(10.0.sp),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 40.0.sp,
                      width: 40.0.sp,
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      )),
                  SizedBox(
                    height: 24.0.h,
                  ),
                  Text(
                    "Loading, please wait",
                    style: TextStyles.small
                        .copyWith(color: Colors.blueAccent),
                  )
                ],
              ),
            ),
          );
        });
 
 
  }

  /// Display Status Dialog with Message

  static Future<void> buildShowDialog(
      {required BuildContext context,
      required double height,
      required String message,
      bool? isDismissible = true}) {
    return showDialog<void>(
        context: context,
        barrierDismissible: isDismissible!,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(24.0.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            content: Container(
              height: height * 0.23,
              padding: EdgeInsets.all(10.0.sp),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyles.small.copyWith(
                      color: Colors.blueAccent,
                      fontSize: 15.0.sp,
                    ),
                  ),
                  SizedBox(height: 30.0.h),
                  SmallActionButton(
                    isFilled: true,
                    width: 200.0.w,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    title: "Okay",
                  )
                ],
              ),
            ),
          );
        });
  }

  /// Display Status with Action
  static Future<void> buildShowDialogWithAction(
      {required BuildContext context,
      required double height,
      required String message,
      required String buttonText,
      required VoidCallback onTap,
      bool? isDismissible = true}) {
    return showDialog<void>(
        context: context,
        barrierDismissible: isDismissible!,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(24.0.sp),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            content: Container(
              height: height * 0.23,
              padding: EdgeInsets.all(10.0.sp),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyles.small.copyWith(
                      color: Colors.blueAccent,
                      fontSize: 15.0.sp,
                    ),
                  ),
                  SizedBox(height: 30.0.h),
                  SmallActionButton(
                    isFilled: true,
                    width: 280.0.w,
                    onTap: () {
                      onTap();
                    },
                    title: buttonText,
                  )
                ],
              ),
            ),
          );
        });
  }


  
}
