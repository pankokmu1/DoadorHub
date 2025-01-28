abstract class CandidateLocalDataSource {
  Future<void> saveCandidates(List<Map<String, dynamic>> candidates);
  Future<void> deleteCandidates();
  Future<List<Map<String, dynamic>>> getCandidates();

  Future<void> saveStatesCandidates(
      List<Map<String, dynamic>> statesCandidates);
  Future<List<Map<String, dynamic>>> getStatesCandidates();
  Future<void> saveImcAgeRange(List<Map<String, dynamic>> imcAgeRange);
  Future<List<Map<String, dynamic>>> getImcAgeRange();
  Future<void> saveObesityPercentage(
      List<Map<String, dynamic>> obesityPercentage);
  Future<List<Map<String, dynamic>>> getObesityPercentage();
  Future<void> saveAverageAgeBloodType(
      List<Map<String, dynamic>> averageAgeBloodType);
  Future<List<Map<String, dynamic>>> getAverageAgeBloodType();
}
