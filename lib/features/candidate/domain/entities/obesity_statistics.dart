import 'package:equatable/equatable.dart';

import '../enums/gender.dart';

class ObesityStatistics extends Equatable {
  final Gender gender;
  final int totalCandidates;
  final int obeseCandidates;
  final double obesityPercentage;

  const ObesityStatistics({
    required this.gender,
    required this.totalCandidates,
    required this.obeseCandidates,
    required this.obesityPercentage,
  });

  factory ObesityStatistics.fromJson(Map<String, dynamic> json) {
    return ObesityStatistics(
      gender: Gender.fromString(json['gender']),
      totalCandidates: json['totalCandidates'],
      obeseCandidates: json['obeseCandidates'],
      obesityPercentage: json['obesityPercentage'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender.name,
      'totalCandidates': totalCandidates,
      'obeseCandidates': obeseCandidates,
      'obesityPercentage': obesityPercentage,
    };
  }

  @override
  List<Object> get props =>
      [gender, totalCandidates, obeseCandidates, obesityPercentage];
}
