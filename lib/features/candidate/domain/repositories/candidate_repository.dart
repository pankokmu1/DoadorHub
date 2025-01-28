import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/blood_compatibility.dart';
import '../entities/blood_type_statistics.dart';
import '../entities/candidate.dart';
import '../entities/imc_age_range.dart';
import '../entities/obesity_statistics.dart';
import '../entities/state_candidate_count.dart';

abstract class CandidateRepository {
  Future<Either<Failure, void>> uploadCandidates(List<Candidate> candidates);
  Future<Either<Failure, void>> checkUploadCandidates();
  Stream<Either<Failure, List<StateCandidateCount>>> getStatesCandidates();
  Stream<Either<Failure, List<IMCAgeRange>>> getImcAgeRange();
  Stream<Either<Failure, List<ObesityStatistics>>> getObesityPercentage();
  Stream<Either<Failure, List<BloodTypeStatistics>>> getAverageAgeBloodType();
  Future<Either<Failure, List<BloodCompatibility>>> getPossibleDonors();
}
