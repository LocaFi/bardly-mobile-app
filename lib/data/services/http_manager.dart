import 'package:bardly_mobile_app/core/constants/app_config.dart';
import 'package:bardly_mobile_app/data/services/dio/dio_logger.dart';
import 'package:dio/dio.dart';

class HttpManager {
  static String? token;
  static String? refreshToken;
  static String? cookie;
  //static User? user;
  final bool? isAuth;
  final String? tag;
  final String? baseUrl;

  final _dio = Dio();

  HttpManager({this.tag, this.baseUrl, this.isAuth}) {
    _dio.options.baseUrl = baseUrl ?? AppConfig.baseUrl;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (!isAuth!) {
            if (token != null) {
              options.headers["Authorization"] = "Bearer $token";
              _dio.options.contentType = Headers.jsonContentType;
              options.headers["cookie"] = HttpManager.cookie;
            } else {
              _dio.options.contentType = Headers.jsonContentType;

              // options.headers["X-Device-Platform"] = "ios";
              // options.headers["X-App-Version"] = "1.0.0";
              // options.headers["X-App-Build-Number"] = "1";
              // options.headers["X-App-Package-Name"] = "com.locafi.app";
            }
          }

          DioLogger.onSend(tag!, options);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          DioLogger.onSuccess(tag!, response);
          return handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) {
          if (error.response?.statusCode == 401) {
            // goto logout
            //token expired
          }
          if (error.response?.statusCode == 403) {
            //refresh token endpointine istek atılacak
          }
          DioLogger.onError(tag!, error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get client => _dio;
}
