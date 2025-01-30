import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';

class CheckUploadCandidates {
  final CandidateRepository repository;

  CheckUploadCandidates(this.repository);

  Future<Either<Failure, void>> call() =>
      repository.checkCandidatesToUploadInCache();
}
