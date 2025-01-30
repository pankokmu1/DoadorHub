import 'package:wk_blood/core/utils/dio_client.dart';
import 'remote_datasource.dart';

class RemoteDataSourceImpl implements DashboardRemoteDataSource {
  final DioClient dio;

  RemoteDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> getDashboard() async {
    final response = await dio.dio.get<Map<String, dynamic>>('/dashboard');

    return response.data!;
    // return {
    //   "total_candidates_per_state": {
    //     "SP": 320,
    //     "RJ": 180,
    //     "MG": 250,
    //     "BA": 150,
    //     "RS": 130
    //   },
    //   "imc_by_age_range": [
    //     {
    //       "range": {"min_age": 0, "max_age": 10},
    //       "average_imc": 15.2
    //     },
    //     {
    //       "range": {"min_age": 11, "max_age": 20},
    //       "average_imc": 21.8
    //     },
    //     {
    //       "range": {"min_age": 21, "max_age": 30},
    //       "average_imc": 24.3
    //     },
    //     {
    //       "range": {"min_age": 31, "max_age": 40},
    //       "average_imc": 26.1
    //     },
    //     {
    //       "range": {"min_age": 41, "max_age": 50},
    //       "average_imc": 27.8
    //     },
    //     {
    //       "range": {"min_age": 51, "max_age": 60},
    //       "average_imc": 28.9
    //     },
    //     {
    //       "range": {"min_age": 61, "max_age": 69},
    //       "average_imc": 29.7
    //     }
    //   ],
    //   "obesity_percentage": {
    //     "Male": {"total": 600, "obese": 180, "percentage_obese": 30.0},
    //     "Female": {"total": 700, "obese": 210, "percentage_obese": 30.0}
    //   },
    //   "average_age_by_blood_type": {
    //     "A+": 36.5,
    //     "A-": 38.2,
    //     "B+": 35.1,
    //     "B-": 39.4,
    //     "AB+": 40.7,
    //     "AB-": 42.0,
    //     "O+": 34.8,
    //     "O-": 37.6
    //   },
    //   "donors_per_blood_type": {
    //     "A+": {"donors_count": 120},
    //     "A-": {"donors_count": 45},
    //     "B+": {"donors_count": 80},
    //     "B-": {"donors_count": 30},
    //     "AB+": {"donors_count": 50},
    //     "AB-": {"donors_count": 20},
    //     "O+": {"donors_count": 150},
    //     "O-": {"donors_count": 60}
    //   }
    // };
  }
}
