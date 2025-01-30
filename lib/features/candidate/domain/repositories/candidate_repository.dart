import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/candidate.dart';

abstract class CandidateRepository {
  Future<Either<Failure, void>> uploadCandidates(List<Candidate> candidates);
  Future<Either<Failure, void>> checkCandidatesToUploadInCache();
  Future<Either<Failure, List<Candidate>>> pickCandidates();
}
