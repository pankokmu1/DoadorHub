import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'local_datasource.dart';
import 'dart:convert';

class CandidateLocalDataSourceImpl implements CandidateLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final FilePicker filePicker;
  CandidateLocalDataSourceImpl(this.secureStorage, this.filePicker);

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
  Future<List<Map<String, dynamic>>> pickCandidates() async {
    final result = await filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null &&
        result.files.isNotEmpty &&
        result.files.first.extension == 'json' &&
        result.files.single.bytes != null) {
      final fileBytes = result.files.single.bytes!;
      String jsonString = utf8.decode(fileBytes);
      return List<Map<String, dynamic>>.from(json.decode(jsonString));
    }
    return [];
  }
}
