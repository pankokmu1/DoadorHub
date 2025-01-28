import 'package:equatable/equatable.dart';
import '../enums/blood_type.dart';

final class BloodTypeStatistics extends Equatable {
  final BloodType bloodType;
  final double averageAge;

  const BloodTypeStatistics({
    required this.bloodType,
    required this.averageAge,
  });

  factory BloodTypeStatistics.fromJson(Map<String, dynamic> json) {
    return BloodTypeStatistics(
      bloodType: BloodType.fromString(json['blood_type']),
      averageAge: json['average_age'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blood_type': bloodType.name,
      'average_age': averageAge,
    };
  }

  @override
  List<Object?> get props => [bloodType, averageAge];
}
