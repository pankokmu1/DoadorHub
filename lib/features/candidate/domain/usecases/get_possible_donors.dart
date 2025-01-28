import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';
import '../entities/blood_compatibility.dart';

class GetPossibleDonors {
  final CandidateRepository repository;

  GetPossibleDonors(this.repository);

  Future<Either<Failure, List<BloodCompatibility>>> call() =>
      repository.getPossibleDonors();
}
