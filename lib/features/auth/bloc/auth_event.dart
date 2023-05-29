part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


class SignUpEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String userName;
  final String phone;
  final String email;
  final String password;

  const SignUpEvent(
      {
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phone, 
      required this.email,
      required this.password,
      });
}

// When the user signing up with email and password this event is called and the [AuthRepository] is called to sign up the user
class LoginEvent extends AuthEvent {
  const LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
 
}
