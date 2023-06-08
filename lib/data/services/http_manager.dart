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
          options.headers["X-API-KEY"] =
              "MU5QT0RGWlBJNUVMR0YwMFNNRjJRR0NWSFdZSlpLV0VGT1hCSktDRkUxSUhKMkJENTFSNklPWkhSQUhQUEk4TDMxNENNMVdLRlhZOEszS1ZSNkFYOVAzTjFLVlVCTTVMNEs1TENHQ0pXMzlMSUxJV0Y4OTBCVlNCTldFUkhERzY=";
          //  options.headers["accept-encoding"] ="gzip";
          //  options.headers["content-length"] ="23";

          //  options.headers["X-API-KEY"] ="";
          //  options.headers["X-API-KEY"] ="";

          // _dio.options.contentType = Headers.jsonContentType;
          // options.headers["cookie"] = "JSESSIONID=B134EAC43337C773A96C942C5BC641FA";

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
