part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

// Registration State
class SignUpLoadingState extends AuthState {}

class SignUpSuccessfulState extends AuthState {
  const SignUpSuccessfulState({required this.message});

  final String message;
}

class SignUpFailedState extends AuthState {
  const SignUpFailedState({required this.message});

  final String message;
}

// Login State
class LoginLoadingState extends AuthState {}

class LoginUserSuccessfulState extends AuthState {
  const LoginUserSuccessfulState({required this.message});

  final String message;
}

class LoginAdminSuccessfulState extends AuthState {
  const LoginAdminSuccessfulState({required this.message});

  final String message;
}

