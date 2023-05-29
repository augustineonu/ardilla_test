import 'package:ardilla_test/features/dashboard/data/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardRepository dashBoardRepository;

  DashboardBloc({ required this.dashBoardRepository})
      : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      try {
        emit(CurrentTimeLoadingState());

        String timeOfDay = dashBoardRepository.getTimeOfDay();
        // Use the timeOfDay value in your business logic or emit a state
        emit(CurrentTimeLoadedState(currentTime: timeOfDay));
      } catch (e) {
        print("Error getting time $e");
        emit(CurrentTimeLoadingFailedState(errorMessage: e.toString()));
      }
    });
  }
}
