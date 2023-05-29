part of 'splashscreen_bloc.dart';

@immutable
abstract class SplashscreenState {}

class SplashscreenInitial extends SplashscreenState {}


class SplashLoading extends SplashscreenState {}

class SplashLoaded extends SplashscreenState {}
