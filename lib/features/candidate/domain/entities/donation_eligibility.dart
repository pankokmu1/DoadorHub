import 'package:equatable/equatable.dart';

final class DonationEligibility extends Equatable {
  final String candidateId;
  final bool isEligible;
  final String? reason;

  const DonationEligibility({
    required this.candidateId,
    required this.isEligible,
    this.reason,
  });

  factory DonationEligibility.fromJson(Map<String, dynamic> json) {
    return DonationEligibility(
      candidateId: json['candidateId'],
      isEligible: json['isEligible'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'candidateId': candidateId,
      'isEligible': isEligible,
      'reason': reason,
    };
  }

  @override
  List<Object?> get props => [candidateId, isEligible, reason];
}
