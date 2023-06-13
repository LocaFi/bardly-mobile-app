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
          options.headers["X-API-KEY"] = AppConfig.publicAPIKey;
          options.headers["X-Device-Platform"] = AppConfig.platform;
          options.headers["X-App-Version"] = AppConfig.appVersion;
          options.headers["X-App-Build-Number"] = AppConfig.buildNumber;
          options.headers["X-App-Package-Name"] = AppConfig.packageName;

          DioLogger.onSend(tag!, options);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          DioLogger.onSuccess(tag!, response);
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // if (error.response?.statusCode == 401) {}
          // if (error.response?.statusCode == 403) {
          //   if (error.response?.data['message'] == "requiredUpdate") {
          //     ProjectController controller = kcontroller.Get.put(ProjectController());
          //     controller.forceUpdateRequired();
          //   }
          // }
          // DioLogger.onError(tag!, error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get client => _dio;
}
