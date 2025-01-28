import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';
import '../entities/imc_age_range.dart';

class GetImcAgeRange {
  final CandidateRepository repository;

  GetImcAgeRange(this.repository);

  Stream<Either<Failure, List<IMCAgeRange>>> call() =>
      repository.getImcAgeRange();
}
