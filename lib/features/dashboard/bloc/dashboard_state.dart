part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState extends Equatable {}

class DashboardInitial extends DashboardState {
  @override
  // TODO: implement props
   List<Object?> get props => [];
}

class CurrentTimeLoadingState extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props =>  [];
}

class CurrentTimeLoadedState extends DashboardState {
  CurrentTimeLoadedState({required this.currentTime});

  @override
  // TODO: implement props
  List<Object?> get props =>  [];
  final String currentTime;
}

class CurrentTimeLoadingFailedState extends DashboardState {
  CurrentTimeLoadingFailedState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props =>  [];
  final String errorMessage;
}
