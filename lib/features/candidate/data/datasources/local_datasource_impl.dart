import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'local_datasource.dart';
import 'dart:convert';

class CandidateLocalDataSourceImpl implements CandidateLocalDataSource {
  final FlutterSecureStorage secureStorage;

  CandidateLocalDataSourceImpl(this.secureStorage);

  @override
  Future<void> saveCandidates(List<Map<String, dynamic>> candidates) async {
    await secureStorage.write(key: 'candidates', value: jsonEncode(candidates));
  }

  @override
  Future<void> deleteCandidates() async {
    await secureStorage.delete(key: 'candidates');
  }

  @override
  Future<List<Map<String, dynamic>>> getCandidates() async {
    final data = await secureStorage.read(key: 'candidates');
    return data != null
        ? List<Map<String, dynamic>>.from(jsonDecode(data))
        : [];
  }

  @override
  Future<void> saveStatesCandidates(
      List<Map<String, dynamic>> statesCandidates) async {
    await secureStorage.write(
        key: 'statesCandidates', value: jsonEncode(statesCandidates));
  }

  @override
  Future<List<Map<String, dynamic>>> getStatesCandidates() async {
    final data = await secureStorage.read(key: 'statesCandidates');
    return data != null
        ? List<Map<String, dynamic>>.from(jsonDecode(data))
        : [];
  }

  @override
  Future<void> saveImcAgeRange(List<Map<String, dynamic>> imcAgeRange) async {
    await secureStorage.write(
        key: 'imcAgeRange', value: jsonEncode(imcAgeRange));
  }

  @override
  Future<List<Map<String, dynamic>>> getImcAgeRange() async {
    final data = await secureStorage.read(key: 'imcAgeRange');
    return data != null
        ? List<Map<String, dynamic>>.from(jsonDecode(data))
        : [];
  }

  @override
  Future<void> saveObesityPercentage(
      List<Map<String, dynamic>> obesityPercentage) async {
    await secureStorage.write(
        key: 'obesityPercentage', value: jsonEncode(obesityPercentage));
  }

  @override
  Future<List<Map<String, dynamic>>> getObesityPercentage() async {
    final data = await secureStorage.read(key: 'obesityPercentage');
    return data != null
        ? List<Map<String, dynamic>>.from(jsonDecode(data))
        : [];
  }

  @override
  Future<void> saveAverageAgeBloodType(
      List<Map<String, dynamic>> averageAgeBloodType) async {
    await secureStorage.write(
        key: 'averageAgeBloodType', value: jsonEncode(averageAgeBloodType));
  }

  @override
  Future<List<Map<String, dynamic>>> getAverageAgeBloodType() async {
    final data = await secureStorage.read(key: 'averageAgeBloodType');
    return data != null
        ? List<Map<String, dynamic>>.from(jsonDecode(data))
        : [];
  }
}
