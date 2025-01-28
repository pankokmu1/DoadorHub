import 'package:equatable/equatable.dart';

import '../enums/state.dart';

class StateCandidateCount extends Equatable {
  final State state;
  final int candidateCount;

  const StateCandidateCount({
    required this.state,
    required this.candidateCount,
  });

  factory StateCandidateCount.fromJson(Map<String, dynamic> json) {
    return StateCandidateCount(
      state: State.fromString(json['state']),
      candidateCount: json['candidate_count'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'state': state.name,
      'candidate_count': candidateCount,
    };
  }

  @override
  List<Object> get props => [state, candidateCount];
}
