import 'package:wk_blood/core/utils/dio_client.dart';
import 'remote_datasource.dart';

class CandidateRemoteDataSourceImpl implements CandidateRemoteDataSource {
  final DioClient dio;

  CandidateRemoteDataSourceImpl(this.dio);

  @override
  Future<void> uploadCandidates(List<Map<String, dynamic>> candidates) async {
    await dio.dio.post('/upload-data', data: candidates);
  }
}
