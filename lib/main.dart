import 'package:ardilla_test/app_config/app_routes/app_router.dart';
import 'package:ardilla_test/features/auth/bloc/auth_bloc.dart';
import 'package:ardilla_test/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:ardilla_test/features/dashboard/data/repository.dart';
import 'package:ardilla_test/features/splashscreen/bloc/splashscreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiRepositoryProvider(
            
            providers: [
              RepositoryProvider<DashBoardRepository>(
                  create: (BuildContext context) => DashBoardRepository(),
                ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider<SplashscreenBloc>(
                  create: (BuildContext context) => SplashscreenBloc(),
                ),
                BlocProvider<DashboardBloc>(
                  create: (BuildContext context) => DashboardBloc(dashBoardRepository: DashBoardRepository()),
                ),
                BlocProvider<AuthBloc>(
                  create: (BuildContext context) => AuthBloc(),
                ),
              ],
              child: MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                title: 'Ardilla',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
              ),
            ),
          );
        });
  }
}
