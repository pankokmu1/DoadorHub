import 'package:wk_blood/features/dashboard/domain/enums/states.dart';
import 'package:wk_blood/features/dashboard/domain/enums/blood_type.dart';

class Dashboard {
  Map<States, int> totalCandidatesPerState;
  List<ImcByAgeRange> imcByAgeRange;
  ObesityPercentage obesityPercentage;
  List<AverageAgeByBloodType> averageAgeByBloodType;
  List<DonorsPerBloodType> donorsPerBloodType;

  Dashboard({
    required this.totalCandidatesPerState,
    required this.imcByAgeRange,
    required this.obesityPercentage,
    required this.averageAgeByBloodType,
    required this.donorsPerBloodType,
  });

  Dashboard.fromJson(Map<String, dynamic> json)
      : totalCandidatesPerState =
            (json['total_candidates_per_state'] as Map<String, int>)
                .map((key, value) => MapEntry(States.fromString(key), value)),
        imcByAgeRange = (json['imc_by_age_range'] as List)
            .map((v) => ImcByAgeRange.fromJson(v))
            .toList(),
        obesityPercentage =
            ObesityPercentage.fromJson(json['obesity_percentage']),
        averageAgeByBloodType = (json['average_age_by_blood_type'] as List)
            .map((v) => AverageAgeByBloodType.fromJson(v))
            .toList(),
        donorsPerBloodType = (json['donors_per_blood_type'] as List)
            .map((v) => DonorsPerBloodType.fromJson(v))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total_candidates_per_state'] = totalCandidatesPerState
        .map((state, count) => MapEntry(state.name, count));
    data['imc_by_age_range'] = imcByAgeRange.map((v) => v.toJson()).toList();
    data['obesity_percentage'] = obesityPercentage.toJson();
    data['average_age_by_blood_type'] =
        averageAgeByBloodType.map((v) => v.toJson()).toList();
    data['donors_per_blood_type'] =
        donorsPerBloodType.map((v) => v.toJson()).toList();
    return data;
  }
}

class ImcByAgeRange {
  Range range;
  double averageImc;

  ImcByAgeRange({
    required this.range,
    required this.averageImc,
  });

  ImcByAgeRange.fromJson(Map<String, dynamic> json)
      : range = Range.fromJson(json['range']),
        averageImc = json['average_imc'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['range'] = range.toJson();
    data['average_imc'] = averageImc;
    return data;
  }
}

class Range {
  int minAge;
  int maxAge;

  Range({
    required this.minAge,
    required this.maxAge,
  });

  Range.fromJson(Map<String, dynamic> json)
      : minAge = json['min_age'],
        maxAge = json['max_age'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['min_age'] = minAge;
    data['max_age'] = maxAge;
    return data;
  }
}

class ObesityPercentage {
  GenderData male;
  GenderData female;

  ObesityPercentage({
    required this.male,
    required this.female,
  });

  ObesityPercentage.fromJson(Map<String, dynamic> json)
      : male = GenderData.fromJson(json['Male']),
        female = GenderData.fromJson(json['Female']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Male'] = male.toJson();
    data['Female'] = female.toJson();
    return data;
  }
}

class GenderData {
  int total;
  int obese;
  double percentageObese;

  GenderData({
    required this.total,
    required this.obese,
    required this.percentageObese,
  });

  GenderData.fromJson(Map<String, dynamic> json)
      : total = json['total'],
        obese = json['obese'],
        percentageObese = json['percentage_obese'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = total;
    data['obese'] = obese;
    data['percentage_obese'] = percentageObese;
    return data;
  }
}

class AverageAgeByBloodType {
  int count;
  BloodType bloodType;

  AverageAgeByBloodType({
    required this.count,
    required this.bloodType,
  });

  AverageAgeByBloodType.fromJson(Map<String, dynamic> json)
      : count = json.values.first,
        bloodType = BloodType.fromString(json.keys.first);

  Map<String, dynamic> toJson() {
    return {
      bloodType.name: count,
    };
  }
}

class DonorsPerBloodType extends AverageAgeByBloodType {
  DonorsPerBloodType({required super.count, required super.bloodType});

  DonorsPerBloodType.fromJson(Map<String, dynamic> json)
      : super(
          count: json.values.first,
          bloodType: BloodType.fromString(json.keys.first),
        );
}
