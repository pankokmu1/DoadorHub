import 'package:dartz/dartz.dart';
import 'package:wk_blood/features/candidate/domain/usecases/get_local_candidates_data.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/candidate_repository.dart';

class UploadCandidates {
  final CandidateRepository repository;
  final GetLocalCandidatesData getLocalCandidatesData;

  UploadCandidates(this.repository, this.getLocalCandidatesData);

  Future<Either<Failure, void>> call() async {
    final candidates = await getLocalCandidatesData();
    return candidates.fold(
      (fail) => Left(fail),
      (candidates) async {
        return await repository.uploadCandidates(candidates);
      },
    );
  }
}
