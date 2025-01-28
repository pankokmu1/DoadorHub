import 'package:equatable/equatable.dart';
import '../enums/blood_type.dart';

final class BloodCompatibility extends Equatable {
  final BloodType donorType;
  final List<BloodType> recipientTypes;
  final List<BloodType> canReceiveFrom;

  const BloodCompatibility({
    required this.donorType,
    required this.recipientTypes,
    required this.canReceiveFrom,
  });

  factory BloodCompatibility.fromJson(Map<String, dynamic> json) {
    return BloodCompatibility(
      donorType: BloodType.fromString(json['donorType']),
      recipientTypes: (json['recipientTypes'] as List<dynamic>)
          .map((type) => BloodType.fromString(type))
          .toList(),
      canReceiveFrom: (json['canReceiveFrom'] as List<dynamic>)
          .map((type) => BloodType.fromString(type))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donorType': donorType.name,
      'recipientTypes': recipientTypes.map((type) => type.name).toList(),
      'canReceiveFrom': canReceiveFrom.map((type) => type.name).toList(),
    };
  }

  @override
  List<Object?> get props => [donorType, recipientTypes, canReceiveFrom];
}
