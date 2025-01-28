import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';

class UploadCandidates {
  final CandidateRepository repository;

  UploadCandidates(this.repository);

  Future<Either<Failure, void>> call() => repository.checkUploadCandidates();
}
