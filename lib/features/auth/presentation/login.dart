import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/app_styles/text_styles.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/components/components.dart';
import 'package:ardilla_test/components/display_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/validators.dart';
import '../bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Validators {
  final _loginKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Container(
                height: 150,
                width: 270,
                //color: Colors.red,
                decoration: const BoxDecoration(
                  // color: AppColors.primaryColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/getStarted_top.png'),
                    fit: BoxFit.cover,
                  ),
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
                        padding: EdgeInsets.only(
                            left: 30.sp, right: 30.sp, top: 50.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _loginKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome !',
                                      style: TextStyles.large.copyWith(
                                          color: AppColors.primaryColorDeep,
                                          fontSize: 36.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "Here's how to Log in to access your account",
                                      style: TextStyles.small.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 40.h),
                                    InputField(
                                      hintText: "Email address or Kode Hex",
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
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    InputField(
                                      hintText: "Password",
                                      hintColor: const Color(0xff9CA3AF),
                                      prefixIcon: const PrefixIconSvg(
                                        assetPath: 'password',
                                      ),
                                      // suffixIcon: const PrefixIconSvg(
                                      //   assetPath: 'fi_eye',
                                      // ),
                                      obscureText: isPasswordObscure,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPasswordObscure =
                                                !isPasswordObscure;
                                          });
                                        },
                                        icon: isPasswordObscure
                                            ? SvgPicture.asset(
                                                'assets/svg/fi_eye.svg')
                                            : SvgPicture.asset(
                                                'assets/svg/fi_eye.svg'),
                                      ),
                                      keyBoardType: TextInputType.name,
                                      validationCallback: validatePassword,
                                      onChanged: (value) {
                                        passwordController.text = value;
                                      },
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Forgot Password?",
                                          style: TextStyles.small.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.sp,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Button(
                                    //   title: 'Log In',
                                    //   color: AppColors.primaryColor,
                                    //   titleColor: AppColors.appWhite,
                                    //   onTap: () {
                                    //     context.go(RoutePath.appHome);
                                    //   },
                                    //   width: width,
                                    // ),
                                    BlocConsumer<AuthBloc, AuthState>(
                                      listener: (context, state) {
                                        // TODO: implement listener
                                        if (_loginKey.currentState!
                                            .validate()) {
                                          if (state is LoginLoadingState) {
                                            Display.buildingLoadingBarrier(
                                                context: context,
                                                height: height);
                                          } else if (state
                                              is LoginUserSuccessfulState) {
                                            Display.onCompletedFlushBar(
                                                title: "Login Successful",
                                                message: state.message,
                                                context: context,
                                                onDisplayCompleted: () {
                                                  context.go(RoutePath.appHome);
                                                });
                                          }
                                        }
                                      },
                                      builder: (context, state) {
                                        return Button(
                                          title: 'Login',
                                          titleColor: Colors.white,
                                          width: width,
                                          isLoading: state is LoginLoadingState
                                              ? true
                                              : false,
                                          onTap: () {
                                            print("testing");
                                            // context.go(RoutePath.appExistingUserLayout);

                                            context
                                                .read<AuthBloc>()
                                                .add(LoginEvent(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                ));
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(height: 15.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: AppColors.grey100,
                                            height: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            'Or',
                                            style: TextStyles.small.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: AppColors.grey100,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Button(
                                      title: 'Sign in with SAN ID',
                                      isIconVisible: true,
                                      icon: SvgPicture.asset(
                                          "assets/svg/mi_log-in.svg"),
                                      color: AppColors.appWhite,
                                      borderColor: AppColors.primaryColor,
                                      titleColor: AppColors.primaryColor,
                                      onTap: () {
                                        context.push(RoutePath.signUp);
                                      },
                                      width: width,
                                    ),
                                    SizedBox(height: 25.h),
                                    InkWell(
                                      onTap: () {
                                        context.push(RoutePath.signUp);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'New user? ',
                                          style: TextStyles.small.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff9CA3AF)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Create Account?',
                                              style: TextStyles.small.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color:
                                                      AppColors.primaryColor),
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
                    ),
                  ],
                );
              }),
            ),
          ]),
        ));
  }
}
