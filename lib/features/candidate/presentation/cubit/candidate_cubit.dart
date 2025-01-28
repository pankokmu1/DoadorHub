import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'candidate_state.dart';

class CandidateCubit extends Cubit<CandidateState> {
  CandidateCubit() : super(CandidateInitial());
}
