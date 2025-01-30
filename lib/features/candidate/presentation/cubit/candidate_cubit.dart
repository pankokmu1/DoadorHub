import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/upload_candidates.dart';

part 'candidate_state.dart';

class CandidateCubit extends Cubit<CandidateState> {
  final UploadCandidates uploadCandidates;

  CandidateCubit(
    this.uploadCandidates,
  ) : super(CandidateInitial());

  Future<void> upload() async {
    emit(CandidateLoading());

    final candidates = await uploadCandidates();
    candidates.fold(
      (failure) => emit(CandidateError(failure.message)),
      (_) => emit(CandidateSuccess()),
    );
  }
}
