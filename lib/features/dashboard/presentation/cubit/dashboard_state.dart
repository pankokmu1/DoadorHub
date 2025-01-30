part of 'dashboard_cubit.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final Dashboard dashboard;

  const DashboardLoaded(this.dashboard);

  @override
  List<Object> get props => [dashboard];
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object> get props => [message];
}

class DashboardWarning extends DashboardState {
  final String message;

  const DashboardWarning(this.message);

  @override
  List<Object> get props => [message];
}

class DashboardEmpty extends DashboardState {}
