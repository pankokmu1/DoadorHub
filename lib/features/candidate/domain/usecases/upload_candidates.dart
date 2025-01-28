import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';
import '../entities/candidate.dart';

class UploadCandidates {
  final CandidateRepository repository;

  UploadCandidates(this.repository);

  Future<Either<Failure, void>> call(List<Candidate> candidates) =>
      repository.uploadCandidates(candidates);
}
