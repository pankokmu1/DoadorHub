import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'local_datasource.dart';

class LocalDataSourceImpl implements DashboardLocalDataSource {
  final FlutterSecureStorage _storage;

  LocalDataSourceImpl(this._storage);

  @override
  Future<Map<String, dynamic>?> dashboard() async {
    final jsonString = await _storage.read(key: 'dashboard');
    return jsonString != null ? json.decode(jsonString) : null;
  }

  @override
  Future<void> saveDashboard(Map<String, dynamic> dashboard) async {
    await _storage.write(key: 'dashboard', value: json.encode(dashboard));
  }
}
