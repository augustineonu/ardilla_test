import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../components/display_helper.dart';
import '../../../helpers/validators.dart';
import '../bloc/auth_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with Validators {
  final signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

    TextEditingController userNameController = TextEditingController();

    TextEditingController emailController = TextEditingController();

    TextEditingController phoneController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    TextEditingController referralCodeController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30.sp, right: 30.sp, bottom: 50.sp),
            child: SingleChildScrollView(
              child: Form(
                key: signUpKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.primaryColorDeep,
                                ),
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                              Text(
                                'Complete your\nprofile',
                                textAlign: TextAlign.start,
                                style: TextStyles.large.copyWith(
                                    color: AppColors.primaryColorDeep,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(height: 50.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InputField(
                            hintText: "Username",
                            hintColor: const Color(0xff9CA3AF),
                            prefixIcon: const PrefixIconSvg(
                              assetPath: 'codeSlash',
                            ),
                            keyBoardType: TextInputType.name,
                            validationCallback: validateEmptyField,
                            onChanged: (value) {
                              userNameController.text = value;
                            },
                          ),
                          SizedBox(height: 13.h),
                          InputField(
                            hintText: "First Name",
                            hintColor: const Color(0xff9CA3AF),
                            prefixIcon: const PrefixIconSvg(
                              assetPath: 'fi_user',
                            ),
                            keyBoardType: TextInputType.name,
                            validationCallback: validateEmptyField,
                            onChanged: (value) {
                              firstNameController.text = value;
                            },
                          ),
                          SizedBox(height: 13.h),
                          InputField(
                            hintText: "Last Name",
                            hintColor: const Color(0xff9CA3AF),
                            prefixIcon: const PrefixIconSvg(
                              assetPath: 'fi_user',
                            ),
                            keyBoardType: TextInputType.name,
                            validationCallback: validateEmptyField,
                            onChanged: (value) {
                              lastNameController.text = value;
                            },
                          ),
                          SizedBox(height: 13.h),
                          InputField(
                            hintText: "Phone Number",
                            hintColor: const Color(0xff9CA3AF),
                            prefixIcon: const PrefixIconSvg(
                              assetPath: 'fi_smartphone',
                            ),
                            keyBoardType: TextInputType.phone,
                            validationCallback: validatePhoneField,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(11),
                            ],
                          ),
                          SizedBox(height: 13.h),
                          const InputField(
                            hintText: "Invite code (optional)",
                            hintColor: Color(0xff9CA3AF),
                            prefixIcon: PrefixIconSvg(
                              assetPath: 'fi_users',
                            ),
                          ),
                          SizedBox(height: 13.h),
                          InputField(
                            hintText: "Password",
                            hintColor: const Color(0xff9CA3AF),
                            prefixIcon: const PrefixIconSvg(
                              assetPath: 'password',
                            ),
                            keyBoardType: TextInputType.text,
                            validationCallback: validatePassword,
                            onChanged: (value) {
                              passwordController.text = value;
                            },
                          ),
                        ],
                      ),
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'By Signing Up , You’re agreeing to our ',
                                style: TextStyles.small.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff9CA3AF)),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: TextStyles.small.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor),
                                  ),
                                  TextSpan(
                                    text: ' and',
                                    style: TextStyles.small.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff9CA3AF)),
                                  ),
                                  TextSpan(
                                    text: ' Privacy Policy',
                                    style: TextStyles.small.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          // Button(
                          //   title: 'Create Account',
                          //   color: AppColors.primaryColor,
                          //   titleColor: AppColors.appWhite,
                          //   onTap: () {
                          //     context.push(RoutePath.login);
                          //   },
                          //   width: width,
                          // ),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (BuildContext context, state) {
                              if (state is SignUpSuccessfulState) {
                                Display.onCompletedFlushBar(
                                    title: 'Registration Successful',
                                    message: state.message,
                                    context: context,
                                    position: FlushbarPosition.TOP,
                                    onDisplayCompleted: () {
                                      context.go(RoutePath.login);
                                    });
                              } else if (state is SignUpFailedState) {
                                Display.onProcessFailed(
                                    title: "failed",
                                    message: state.message,
                                    context: context,
                                    position: FlushbarPosition.TOP);
                              }
                            },
                            builder: (context, state) {
                              return Button(
                                title: 'Create Account',
                                titleColor: Colors.white,
                                width: width,
                                isLoading:
                                    state is SignUpLoadingState ? true : false,
                                onTap: () {
                                  if (signUpKey.currentState!.validate()) {
                                    print("signup called");
                                    context.read<AuthBloc>().add(SignUpEvent(
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          userName: userNameController.text,
                                          email: emailController.text,
                                          phone: phoneController.text,
                                          password: passwordController.text,
                                        ));
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
