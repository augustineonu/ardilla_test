import 'package:ardilla_test/app_config/app_styles/app_colors.dart';
import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/features/splashscreen/bloc/splashscreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashBloc = SplashscreenBloc();

  @override
  void initState() {
    // TODO: implement initState
    _splashBloc.add(SetSplashscreenEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashBloc,
      child: BlocConsumer<SplashscreenBloc, SplashscreenState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            context.replace(RoutePath.onBoarding);
          }
        },
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: Colors.transparent,
            backgroundColor: AppColors.primaryColor,
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Image.asset(
                  "assets/images/logo_ardilla.png",
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
