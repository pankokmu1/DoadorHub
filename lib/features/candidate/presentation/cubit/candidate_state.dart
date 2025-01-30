part of 'candidate_cubit.dart';

abstract class CandidateState extends Equatable {
  const CandidateState();

  @override
  List<Object> get props => [];
}

class CandidateInitial extends CandidateState {}

class CandidateLoading extends CandidateState {}

class CandidateSuccess extends CandidateState {}

class CandidateError extends CandidateState {
  final String message;

  const CandidateError(this.message);

  @override
  List<Object> get props => [message];
}
