import 'package:dio/dio.dart';

class HttpException implements Exception {
  Response response;

  HttpException(
    this.response,
  );

  @override
  String toString() {
    return 'HttpException{response: $response}';
  }

  static String handleError(Exception? error) {
    String? errorDescription = "";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.badResponse:
          if (error.response?.statusCode == 503 ||
              error.response?.statusCode == 502) {
            errorDescription = 'maintenance';
          } else if (error.response?.statusCode ==
              500) {
            errorDescription =
                error.response?.data["error"];
          } else {
            errorDescription =
                error.response?.data;
          }
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = error.response?.data;
          break;
        case DioErrorType.connectionError:
          errorDescription = error.response?.data;
          break;
        case DioErrorType.badCertificate:
          errorDescription = error.response?.data;
          break;
        case DioErrorType.sendTimeout:
          errorDescription = error.response?.data;
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = error.response?.data;
          break;
        case DioErrorType.cancel:
          errorDescription = error.response?.data;
          break;
        case DioErrorType.unknown:
          errorDescription = error.response?.data;
          break;
      }
    }
    return errorDescription ?? 'unknownError';
  }
}
