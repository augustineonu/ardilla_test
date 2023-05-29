import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      // TODO: implement event handler
      emit(SignUpLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(const SignUpSuccessfulState(message: 'Please, Login'));
    });
    on<LoginEvent>((event, emit) async {
      // TODO: implement event handler
      emit(LoginLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(const LoginUserSuccessfulState(message: 'Success'));
    });
  }
}
