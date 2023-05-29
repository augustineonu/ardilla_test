import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(SplashscreenInitial()) {
    // on<SplashscreenEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<SplashscreenEvent>((event, emit) async {
      emit(SplashLoading());
      print("splashLoading>>>>>>");
      await Future.delayed(Duration(seconds: 3));
      print("splashLoaded  >>>>>>");
      emit(SplashLoaded());
      // final bool value = await  authRepository.hasToken();
      // print("splashscreen >>");
      // if (await authRepository.hasToken() == true){
      //   emit(SplashLoadedReturningUser());
      // } else {
      //   emit(SplashLoadedNewUser());
      // }
    });
  }
}
