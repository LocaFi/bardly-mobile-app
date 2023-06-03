import 'dart:convert';

import 'package:bardly_mobile_app/data/services/http_manager.dart';
import 'package:dio/dio.dart';
import 'package:pretty_logger/pretty_logger.dart';
import 'log.dart';

class DioLogger {
  static void onSend(String tag, RequestOptions options) {
    if (options.data.runtimeType == FormData) {
      return;
    }
    PLog.warning(''' 
   
┌-----------------------------------------------------------------------------------------
 [DIO] 
 tag - Request Path : [${options.method}] ${options.baseUrl}${options.path}
 tag - Request Params : ${jsonEncode(options.queryParameters)}
 content-type: ${options.contentType}
 accept: ${options.contentType}; charset=utf-8
 cookie: ${options.headers["cookie"]}
 Access-Token: ${options.headers["Authorization"] != null ? 'true' : 'false'}
├------------------------------------------------------------------------------------------
 [DIO] Response [code 200]: OK
└------------------------------------------------------------------------------------------
 ''');
    // Log.api(
    //   '$tag - Request Path : [${options.method}] ${options.baseUrl}${options.path}'
    //   '$_divider'
    //   '$tag - Request Data : ${options.data is Map ? jsonEncode(options.data) : jsonEncode(options.data)}'
    //   '$_divider'
    //   '$tag - Request Params : ${jsonEncode(options.queryParameters)}',
    // );
  }

  static void onSuccess(
    String tag,
    Response response,
  ) {
    PLog.warning(''' 
┌-----------------------------------------------------------------------------------------
 [DIO] 
 tag - Request Path : [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path}
 tag - Request Params : \n${jsonEncode(response.data)}
 content-type: ${response.headers['Content-Type']}
 accept: ${response.headers['Content-Type']}; charset=utf-8
 cookie: ${HttpManager.cookie != null ? 'true' : 'false'}
 Access-Token: ${HttpManager.token != null ? 'true' : 'false'}
├------------------------------------------------------------------------------------------
 [DIO] Response [code  ${response.statusCode}]:  ${response.statusCode}
 [RESPONSE] : \n${response.data is String ? response.data : jsonEncode(response.data)}
└------------------------------------------------------------------------------------------
 ''');
    // Log.api(
    //   '$tag - Response Path : [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path}'
    //   '$_divider'
    //   '$tag - Response statusCode : ${response.statusCode}'
    //   '$_divider'
    //   '$tag - Response data : ${response.data is String ? response.data : jsonEncode(response.data)}',
    // );
  }

  static void onError(String? tag, DioError? error) {
    if (null != error?.response) {
      PLog.warning(''' 
   
┌-----------------------------------------------------------------------------------------
 [DIO] 
 tag - Request Path : [${error?.response?.requestOptions.method}] ${error?.response?.requestOptions.baseUrl}${error?.response?.requestOptions.path}
 tag - Request Params : ${jsonEncode(error?.requestOptions)}
 content-type: ${error?.response?.headers['Content-Type']}
 accept: ${error?.response?.headers['Content-Type']}; charset=utf-8
 cookie: ${error?.response?.headers["cookie"]}
 Access-Token: ${error?.response?.headers["Authorization"] != null ? 'true' : 'false'}
├------------------------------------------------------------------------------------------
 [DIO] Response [code  ${error?.response?.statusCode}]
 [RESPONSE] : ${error?.message}
└------------------------------------------------------------------------------------------
 ''');
      // Log.api(
      //   '$tag - Error Path : [${error?.response?.requestOptions.method}] ${error?.response?.requestOptions.baseUrl}${error?.response?.requestOptions.path}'
      //   '$_divider'
      //   '$tag - Error Data : ${error?.response?.data is Map ? jsonEncode(error!.response!.data) : error?.response?.data}'
      //   '$_divider'
      //   '$tag - Error Status Code : ${error?.response?.statusCode}'
      //   '$_divider'
      //   '$tag - Error Message : ${error?.message}',
      // );
    } else {
      Log.api(
        '$tag - Error Message : ${error?.message}',
      );
    }
  }

  static String get _divider => '\n${'-' * 30}\n';
}
