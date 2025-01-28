import 'package:dio/dio.dart';
import 'remote_datasource.dart';

class CandidateRemoteDataSourceImpl implements CandidateRemoteDataSource {
  final Dio dio;

  CandidateRemoteDataSourceImpl(this.dio);

  @override
  Future<void> uploadCandidates(List<Map<String, dynamic>> candidates) async {
    await dio.post('/upload-data', data: candidates);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchStatesCandidates() async {
    final response = await dio.get('/states-candidates');
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchImcAgeRange() async {
    final response = await dio.get('/imc-age-range');
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchObesityPercentage() async {
    final response = await dio.get('/obesity-percentage');
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchAverageAgeBloodType() async {
    final response = await dio.get('/average-age-blood-type');
    return List<Map<String, dynamic>>.from(response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> fetchPossibleDonors() async {
    final response = await dio.get('/possible-donors');
    return List<Map<String, dynamic>>.from(response.data);
  }
}
