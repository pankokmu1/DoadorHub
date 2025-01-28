import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/blood_compatibility.dart';
import '../../domain/entities/blood_type_statistics.dart';
import '../../domain/entities/candidate.dart';
import '../../domain/entities/imc_age_range.dart';
import '../../domain/entities/obesity_statistics.dart';
import '../../domain/entities/state_candidate_count.dart';
import '../../domain/repositories/candidate_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  final CandidateRemoteDataSource remoteDataSource;
  final CandidateLocalDataSource localDataSource;

  CandidateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> uploadCandidates(
      List<Candidate> candidates) async {
    try {
      final candidateMaps =
          candidates.map((candidate) => candidate.toJson()).toList();
      await remoteDataSource.uploadCandidates(candidateMaps);
      return Right(null);
    } catch (e) {
      return Left(e is Failure ? e : UnknowFailure());
    }
  }

  @override
  Future<Either<Failure, void>> checkUploadCandidates() async {
    try {
      final candidateMaps = await localDataSource.getCandidates();
      if (candidateMaps.isNotEmpty) {
        await remoteDataSource.uploadCandidates(candidateMaps);
        await localDataSource.deleteCandidates();
      }
      return Right(null);
    } catch (e) {
      return Left(e is Failure ? e : UnknowFailure());
    }
  }

  @override
  Stream<Either<Failure, List<StateCandidateCount>>>
      getStatesCandidates() async* {
    try {
      final localData = await localDataSource.getStatesCandidates();
      if (localData.isNotEmpty) {
        yield Right(
            localData.map((map) => StateCandidateCount.fromJson(map)).toList());
      }
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }

    try {
      final remoteData = await remoteDataSource.fetchStatesCandidates();
      final stateCandidates =
          remoteData.map((map) => StateCandidateCount.fromJson(map)).toList();
      await localDataSource.saveStatesCandidates(remoteData);
      yield Right(stateCandidates);
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }
  }

  @override
  Stream<Either<Failure, List<IMCAgeRange>>> getImcAgeRange() async* {
    try {
      final localData = await localDataSource.getImcAgeRange();
      if (localData.isNotEmpty) {
        yield Right(localData.map((map) => IMCAgeRange.fromJson(map)).toList());
      }
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }

    try {
      final remoteData = await remoteDataSource.fetchImcAgeRange();
      final imcAgeRanges =
          remoteData.map((map) => IMCAgeRange.fromJson(map)).toList();
      await localDataSource.saveImcAgeRange(remoteData);
      yield Right(imcAgeRanges);
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }
  }

  @override
  Stream<Either<Failure, List<ObesityStatistics>>>
      getObesityPercentage() async* {
    try {
      final localData = await localDataSource.getObesityPercentage();
      if (localData.isNotEmpty) {
        yield Right(
            localData.map((map) => ObesityStatistics.fromJson(map)).toList());
      }
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }

    try {
      final remoteData = await remoteDataSource.fetchObesityPercentage();
      final obesityStats =
          remoteData.map((map) => ObesityStatistics.fromJson(map)).toList();
      await localDataSource.saveObesityPercentage(remoteData);
      yield Right(obesityStats);
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }
  }

  @override
  Stream<Either<Failure, List<BloodTypeStatistics>>>
      getAverageAgeBloodType() async* {
    try {
      final localData = await localDataSource.getAverageAgeBloodType();
      if (localData.isNotEmpty) {
        yield Right(
            localData.map((map) => BloodTypeStatistics.fromJson(map)).toList());
      }
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }

    try {
      final remoteData = await remoteDataSource.fetchAverageAgeBloodType();
      final bloodTypeStats =
          remoteData.map((map) => BloodTypeStatistics.fromJson(map)).toList();
      await localDataSource.saveAverageAgeBloodType(remoteData);
      yield Right(bloodTypeStats);
    } catch (e) {
      yield Left(e is Failure ? e : UnknowFailure());
    }
  }

  @override
  Future<Either<Failure, List<BloodCompatibility>>> getPossibleDonors() async {
    try {
      final remoteData = await remoteDataSource.fetchPossibleDonors();
      final possibleDonors =
          remoteData.map((map) => BloodCompatibility.fromJson(map)).toList();
      return Right(possibleDonors);
    } catch (e) {
      return Left(e is Failure ? e : UnknowFailure());
    }
  }
}
