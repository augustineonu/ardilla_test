import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/components/button.dart';
import 'package:ardilla_test/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../components/input_field.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> with Validators {
  final emailKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       // Handle back button press
        //     },
        //   ),
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/getStarted_top.png'),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),

        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 150.h,
                      width: 250.w,
                      //color: Colors.red,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/getStarted_top.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.sp),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 169, 93, 236),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                    ),
                    Positioned(
                      top: 20.sp,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: constraints.maxHeight,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.sp, vertical: 65.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Get Started',
                                    style: TextStyles.large.copyWith(
                                        color: AppColors.primaryColorDeep,
                                        fontSize: 36.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'To Create an account enter a valid email address',
                                    style: TextStyles.small.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
                                  Form(
                                    key: emailKey,
                                    child: InputField(
                                      hintText: "Email address",
                                      hintColor: const Color(0xff9CA3AF),
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: AppColors.appGrey,
                                      ),
                                      keyBoardType: TextInputType.emailAddress,
                                      validationCallback: validateEmail,
                                      onChanged: (value) {
                                        emailController.text = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 120.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Button(
                                    title: 'Continue',
                                    color: AppColors.grey200,
                                    titleColor: AppColors.appWhite,
                                    onTap: () {
                                      if (emailKey.currentState!.validate()) {
                                        context.push(RoutePath.verifyEmail);
                                      }
                                    },
                                    width: width,
                                  ),
                                  SizedBox(height: 45.h),
                                  InkWell(
                                    onTap: () {
                                      context.push(RoutePath.login);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Already have an account?  ',
                                        style: TextStyles.small.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff9CA3AF)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Sign in',
                                            style: TextStyles.small.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ]),
        ));
  }
}
