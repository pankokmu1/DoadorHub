abstract class CandidateRemoteDataSource {
  Future<void> uploadCandidates(List<Map<String, dynamic>> candidates);
  Future<List<Map<String, dynamic>>> fetchStatesCandidates();
  Future<List<Map<String, dynamic>>> fetchImcAgeRange();
  Future<List<Map<String, dynamic>>> fetchObesityPercentage();
  Future<List<Map<String, dynamic>>> fetchAverageAgeBloodType();
  Future<List<Map<String, dynamic>>> fetchPossibleDonors();
}
