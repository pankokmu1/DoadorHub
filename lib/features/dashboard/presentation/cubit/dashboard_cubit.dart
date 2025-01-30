import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wk_blood/core/errors/failures.dart';
import 'package:wk_blood/features/dashboard/domain/entities/dashboard.dart';
import 'package:wk_blood/features/dashboard/domain/usecases/get_dashboard.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboard _getDashboard;
  DashboardCubit(GetDashboard getDashboard)
      : _getDashboard = getDashboard,
        super(DashboardInitial());
  bool _hasData = false;
  Future<void> fetchDashboard() async {
    emit(DashboardLoading());
    await for (final result in _getDashboard()) {
      result.fold(
        (failure) {
          if (failure is EmptyResultFailure) {
            emit(DashboardEmpty());
          } else {
            emit(
              _hasData
                  ? DashboardWarning(failure.message)
                  : DashboardError(failure.message),
            );
          }
        },
        (dashboard) {
          _hasData = true;
          emit(DashboardLoaded(dashboard));
        },
      );
    }
  }
}
