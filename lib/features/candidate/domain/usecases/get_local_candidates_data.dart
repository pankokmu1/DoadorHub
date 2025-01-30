import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:wk_blood/core/errors/failures.dart';

import '../entities/candidate.dart';
import '../repositories/candidate_repository.dart';

class GetLocalCandidatesData {
  final CandidateRepository repository;

  GetLocalCandidatesData(this.repository);

  Future<Either<Failure, List<Candidate>>> call() =>
      repository.pickCandidates();
}
