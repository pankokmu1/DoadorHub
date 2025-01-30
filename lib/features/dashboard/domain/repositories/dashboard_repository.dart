import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/dashboard.dart';

abstract class DashboardRepository {
  Stream<Either<Failure, Dashboard>> getDashboard();
}
