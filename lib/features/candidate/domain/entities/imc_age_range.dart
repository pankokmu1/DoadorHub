import 'package:equatable/equatable.dart';

final class IMCAgeRange extends Equatable {
  final AgeRange range;
  final double averageIMC;

  const IMCAgeRange({
    required this.range,
    required this.averageIMC,
  });

  factory IMCAgeRange.fromJson(Map<String, dynamic> json) {
    return IMCAgeRange(
      range: AgeRange.fromJson(json['range']),
      averageIMC: json['average_imc'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'range': range.toJson(),
      'average_imc': averageIMC,
    };
  }

  @override
  List<Object> get props => [range, averageIMC];
}

final class AgeRange extends Equatable {
  final int minAge;
  final int maxAge;

  const AgeRange({
    required this.minAge,
    required this.maxAge,
  });

  factory AgeRange.fromJson(Map<String, dynamic> json) {
    return AgeRange(
      minAge: json['min_age'],
      maxAge: json['max_age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min_age': minAge,
      'max_age': maxAge,
    };
  }

  @override
  List<Object> get props => [minAge, maxAge];
}
