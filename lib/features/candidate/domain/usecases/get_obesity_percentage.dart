import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';
import '../entities/obesity_statistics.dart';

class GetObesityPercentage {
  final CandidateRepository repository;

  GetObesityPercentage(this.repository);

  Stream<Either<Failure, List<ObesityStatistics>>> call() =>
      repository.getObesityPercentage();
}
