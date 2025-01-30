import 'package:dio/dio.dart';
import '../errors/failures.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = 'https://api.example.com' //TODO: add api route
      ..options.connectTimeout = const Duration(seconds: 5)
      ..options.receiveTimeout = const Duration(seconds: 5)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          Failure failure;
          switch (e.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
              failure = const ConectionFailure();
              break;
            case DioExceptionType.badResponse:
              if (e.response?.statusCode == 404) {
                failure = const EmptyResultFailure();
              } else {
                failure = const ServerFailure();
              }
              break;
            case DioExceptionType.cancel:
              failure = const UnknowFailure();
              break;
            default:
              failure = const UnknowFailure();
          }
          return handler.reject(DioException(
            requestOptions: e.requestOptions,
            error: failure,
          ));
        },
      ));
  }

  Dio get dio => _dio;
}
