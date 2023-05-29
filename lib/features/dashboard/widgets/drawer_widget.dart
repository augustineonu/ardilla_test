import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/features/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 56.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile_pic.png'),
                  radius: 30,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text("Anita Ojieh",
                style: TextStyles.small.copyWith(
                    color: AppColors.appWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp)),
            SizedBox(
              height: 60.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DoubleSidebarWidget(
                  icon: 'assets/svg/user_2.svg',
                  title: 'Profile',
                ),
                SizedBox(
                  height: 17.0.h,
                ),
                const DoubleSidebarWidget(
                  icon: 'assets/svg/work.svg',
                  title: 'Porfolio',
                ),
                SizedBox(
                  height: 17.0.h,
                ),
                const DoubleSidebarWidget(
                  icon: 'assets/svg/card.svg',
                  title: 'Payment',
                ),
                SizedBox(
                  height: 17.0.h,
                ),
                const TripleSidebarWidget(
                  icon: 'assets/svg/investment.svg',
                  title: 'Investment',
                ),
                SizedBox(
                  height: 17.0.h,
                ),
                const TripleSidebarWidget(
                  icon: 'assets/svg/ic_baseline-security.svg',
                  title: 'Insurance',
                ),
                SizedBox(
                  height: 17.0.h,
                ),
                const DoubleSidebarWidget(
                  icon: 'assets/svg/explore.svg',
                  title: 'Budgeting',
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColors.appWhite,
                        insetPadding: EdgeInsets.all(24.0.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0.r),
                        ),
                        content: Container(
                          height: 150.h,
                          padding: EdgeInsets.all(10.0.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Are you sure you want to LOG OUT?",
                                style: TextStyles.small.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 20.0.h,
                              ),
                              Row(
                                children: [
                                  DefaultButton(
                                    title: 'Confirm',
                                    color: (const Color(0xffFCE4EB)),
                                    titleColor: AppColors.secondaryColor,
                                    onTap: () {
                                      context.go(RoutePath.login);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  DefaultButton(
                                      title: 'No, Cancel',
                                      //color: (Colors.white),
                                      onTap: () {
                                        context.pop();
                                      },
                                      titleColor: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const DoubleSidebarWidget(
                icon: 'assets/svg/bx_log-out-circle.svg',
                title: 'Log Out',
              ),
            ),
          ],
        ));
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.color,
    required this.titleColor,
    this.onTap,
  });
  final String title;
  final Color titleColor;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.h,
        height: 40.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(17.0.r),
          ),
          //color: color ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.small.copyWith(fontSize: 14, color: titleColor),
          ),
        ),
      ),
    );
  }
}
