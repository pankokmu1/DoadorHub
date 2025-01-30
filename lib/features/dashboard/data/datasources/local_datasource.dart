abstract class DashboardLocalDataSource {
  Future<Map<String, dynamic>?> dashboard();
  Future<void> saveDashboard(Map<String, dynamic> dashboard);
}
