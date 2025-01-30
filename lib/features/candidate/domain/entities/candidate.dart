import 'package:equatable/equatable.dart';
import 'package:wk_blood/features/dashboard/domain/enums/blood_type.dart';
import 'package:wk_blood/features/dashboard/domain/enums/states.dart';
import '../enums/gender.dart';

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
  final States state;
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
    States? state,
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
      'nome': name,
      'cpf': cpf,
      'rg': rg,
      'data_nasc': birthDate,
      'sexo': gender.name,
      'mae': mother,
      'pai': father,
      'email': email,
      'cep': postalCode,
      'endereco': address,
      'numero': number,
      'bairro': neighborhood,
      'cidade': city,
      'estado': state.name,
      'telefone_fixo': landline,
      'celular': mobile,
      'altura': height,
      'peso': weight,
      'tipo_sanguineo': bloodType.name,
    };
  }

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      name: json['nome'],
      cpf: json['cpf'],
      rg: json['rg'],
      birthDate: json['data_nasc'],
      gender: Gender.fromString(json['sexo']),
      mother: json['mae'],
      father: json['pai'],
      email: json['email'],
      postalCode: json['cep'],
      address: json['endereco'],
      number: json['numero'],
      neighborhood: json['bairro'],
      city: json['cidade'],
      state: States.fromString(json['estado']),
      landline: json['telefone_fixo'],
      mobile: json['celular'],
      height: (json['altura'] as num).toDouble(),
      weight: (json['peso'] as num).toDouble(),
      bloodType: BloodType.fromString(json['tipo_sanguineo']),
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
