import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';
import '../entities/blood_type_statistics.dart';

class GetAverageAgeBloodType {
  final CandidateRepository repository;

  GetAverageAgeBloodType(this.repository);

  Stream<Either<Failure, List<BloodTypeStatistics>>> call() =>
      repository.getAverageAgeBloodType();
}
