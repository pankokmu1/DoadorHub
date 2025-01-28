import 'package:equatable/equatable.dart';
import '../enums/blood_type.dart';
import '../enums/gender.dart';
import '../enums/state.dart';

final class Candidate extends Equatable {
  final String name;
  final String cpf;
  final String rg;
  final String birthDate;
  final Gender gender;
  final String mother;
  final String father;
  final String email;
  final String postalCode;
  final String address;
  final int number;
  final String neighborhood;
  final String city;
  final State state;
  final String landline;
  final String mobile;
  final double height;
  final double weight;
  final BloodType bloodType;

  const Candidate({
    required this.name,
    required this.cpf,
    required this.rg,
    required this.birthDate,
    required this.gender,
    required this.mother,
    required this.father,
    required this.email,
    required this.postalCode,
    required this.address,
    required this.number,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.landline,
    required this.mobile,
    required this.height,
    required this.weight,
    required this.bloodType,
  });

  Candidate copyWith({
    String? name,
    String? cpf,
    String? rg,
    String? birthDate,
    Gender? gender,
    String? mother,
    String? father,
    String? email,
    String? postalCode,
    String? address,
    int? number,
    String? neighborhood,
    String? city,
    State? state,
    String? landline,
    String? mobile,
    double? height,
    double? weight,
    BloodType? bloodType,
  }) {
    return Candidate(
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      mother: mother ?? this.mother,
      father: father ?? this.father,
      email: email ?? this.email,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
      number: number ?? this.number,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      landline: landline ?? this.landline,
      mobile: mobile ?? this.mobile,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bloodType: bloodType ?? this.bloodType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cpf': cpf,
      'rg': rg,
      'birth_date': birthDate,
      'gender': gender.name,
      'mother': mother,
      'father': father,
      'email': email,
      'postal_code': postalCode,
      'address': address,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'state': state.name,
      'landline': landline,
      'mobile': mobile,
      'height': height,
      'weight': weight,
      'blood_type': bloodType.name,
    };
  }

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      name: json['name'],
      cpf: json['cpf'],
      rg: json['rg'],
      birthDate: json['birth_date'],
      gender: Gender.fromString(json['gender']),
      mother: json['mother'],
      father: json['father'],
      email: json['email'],
      postalCode: json['postal_code'],
      address: json['address'],
      number: json['number'],
      neighborhood: json['neighborhood'],
      city: json['city'],
      state: State.fromString(json['state']),
      landline: json['landline'],
      mobile: json['mobile'],
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      bloodType: BloodType.fromString(json['blood_type']),
    );
  }

  @override
  List<Object?> get props => [
        name,
        cpf,
        rg,
        birthDate,
        gender,
        mother,
        father,
        email,
        postalCode,
        address,
        number,
        neighborhood,
        city,
        state,
        landline,
        mobile,
        height,
        weight,
        bloodType,
      ];
}
