import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/candidate.dart';
import '../../domain/repositories/candidate_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';

class CandidateRepositoryImpl implements CandidateRepository {
  final CandidateRemoteDataSource remoteDataSource;
  final CandidateLocalDataSource localDataSource;

  CandidateRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

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
  Future<Either<Failure, void>> checkCandidatesToUploadInCache() async {
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
  Future<Either<Failure, List<Candidate>>> pickCandidates() async {
    try {
      final data = await compute(_pickCandidatesInIsolate, null);
      return Right(data);
    } catch (e) {
      return Left(e is Failure ? e : UnknowFailure());
    }
  }

  Future<List<Candidate>> _pickCandidatesInIsolate(_) async {
    final data = await localDataSource.pickCandidates();
    return data.map((map) => Candidate.fromJson(map)).toList();
  }
}
