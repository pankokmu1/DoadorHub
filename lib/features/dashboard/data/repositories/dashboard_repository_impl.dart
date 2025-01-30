import 'package:dartz/dartz.dart';
import 'package:wk_blood/features/dashboard/data/datasources/local_datasource.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/dashboard.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/remote_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Stream<Either<Failure, Dashboard>> getDashboard() async* {
    try {
      final localDashboard = await localDataSource.dashboard();
      if (localDashboard != null) {
        yield Right(Dashboard.fromJson(localDashboard));
      }
      final remoteDashboard = await remoteDataSource.getDashboard();
      yield Right(Dashboard.fromJson(remoteDashboard));
      if (localDashboard != remoteDashboard) {
        await localDataSource.saveDashboard(remoteDashboard);
      }
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }
  }
}
