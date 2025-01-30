abstract class CandidateLocalDataSource {
  Future<void> saveCandidates(List<Map<String, dynamic>> candidates);
  Future<void> deleteCandidates();
  Future<List<Map<String, dynamic>>> getCandidates();
  Future<List<Map<String, dynamic>>> pickCandidates();
}
