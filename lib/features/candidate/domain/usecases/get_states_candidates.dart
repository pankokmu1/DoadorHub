import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';
import '../entities/state_candidate_count.dart';

class GetStatesCandidates {
  final CandidateRepository repository;

  GetStatesCandidates(this.repository);

  Stream<Either<Failure, List<StateCandidateCount>>> call() =>
      repository.getStatesCandidates();
}
