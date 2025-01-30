import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:wk_blood/core/utils/dio_client.dart';
import 'package:wk_blood/features/candidate/data/datasources/local_datasource.dart';
import 'package:wk_blood/features/candidate/data/datasources/local_datasource_impl.dart';
import 'package:wk_blood/features/candidate/data/datasources/remote_datasource.dart';
import 'package:wk_blood/features/candidate/data/datasources/remote_datasource_impl.dart';
import 'package:wk_blood/features/candidate/data/repositories/candidate_repository_impl.dart';
import 'package:wk_blood/features/candidate/domain/repositories/candidate_repository.dart';
import 'package:wk_blood/features/candidate/domain/usecases/check_upload_candidates.dart';
import 'package:wk_blood/features/candidate/domain/usecases/get_local_candidates_data.dart';
import 'package:wk_blood/features/candidate/domain/usecases/upload_candidates.dart';
import 'package:wk_blood/features/candidate/presentation/cubit/candidate_cubit.dart';
import 'package:wk_blood/features/dashboard/data/datasources/local_datasource.dart';
import 'package:wk_blood/features/dashboard/data/datasources/local_datasource_impl.dart';
import 'package:wk_blood/features/dashboard/data/datasources/remote_datasource.dart';
import 'package:wk_blood/features/dashboard/data/datasources/remote_datasource_impl.dart';
import 'package:wk_blood/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:wk_blood/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:wk_blood/features/dashboard/domain/usecases/get_dashboard.dart';
import 'package:wk_blood/features/dashboard/presentation/cubit/dashboard_cubit.dart';

final di = GetIt.instance;

void init() {
  di
    ..registerFactory(
      () => CandidateCubit(di()),
    )
    ..registerFactory(
      () => DashboardCubit(di()),
    )
    ..registerLazySingleton(() => UploadCandidates(di(), di()))
    ..registerLazySingleton(() => GetLocalCandidatesData(di()))
    ..registerLazySingleton(() => CheckUploadCandidates(di()))
    ..registerLazySingleton<DioClient>(() => DioClient(Dio()))
    ..registerLazySingleton<FilePicker>(() => FilePicker.platform)
    ..registerLazySingleton<FlutterSecureStorage>(() => FlutterSecureStorage())
    ..registerLazySingleton(() => GetDashboard(di()))
    ..registerLazySingleton<CandidateRepository>(
      () => CandidateRepositoryImpl(di(), di()),
    )
    ..registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl(di(), di()),
    )
    ..registerLazySingleton<CandidateRemoteDataSource>(
      () => CandidateRemoteDataSourceImpl(di()),
    )
    ..registerLazySingleton<CandidateLocalDataSource>(
      () => CandidateLocalDataSourceImpl(di(), di()),
    )
    ..registerLazySingleton<DashboardRemoteDataSource>(
      () => RemoteDataSourceImpl(di()),
    )
    ..registerLazySingleton<DashboardLocalDataSource>(
      () => LocalDataSourceImpl(di()),
    );
}
