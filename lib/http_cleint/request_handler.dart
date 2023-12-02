import 'dart:developer' show log;
import 'package:dio/dio.dart';
import '../getit_locator.dart';
import '../preferences/prefs_keys.dart';
import '../preferences/shared_prefs.dart';
import 'app_config.dart';

class RequestHandler {
  RequestHandler({
    required Dio dio
  })  : _dio = dio;

  final Dio _dio;
  Dio get dio => _dio;

  updateHeader({required String token}) async {
    locator<MyPrefs>().settString(key: PrefsKeys.authToken, value: token);
    String? currentToken = locator<MyPrefs>().gettString(key: PrefsKeys.authToken);
    log("#UpdatedHeader: \$TOKEN => $currentToken");
    print("#UpdatedHeader: \$TOKEN => Bearer $currentToken");
    dio.options.headers['Authorization'] = 'Bearer $currentToken';
    // dio.options.headers['Authorization'] = 'Bearer $currentToken';
    dio.options.headers['Connection'] = 'keep-alive';
    dio.options = BaseOptions(
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5)
    );
  }

  static const mainUrl = AppConfig.baseUrl;

  Future<Response> post(
    String url,
    dynamic params, {
    bool tokenNeeded = true,
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    
    try {
      final response = await dio.post(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      log("url => ${mainUrl+url}");
      //log("params => $params");
      //log("response => $response");
      
      return response;
    } on DioException catch (error, stracktrace) {
      throw RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      throw RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future<Response> postWithoutParams(
    String url, {
    bool tokenNeeded = true,
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.post(
        baseUrl ?? mainUrl + url,
        options: options,
        queryParameters: queryParams,
      );
      log("url => ${mainUrl+url}");
      log("get response => $response");
      return response;
    } on DioException catch (error, stracktrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future<Response> get(
    String url, {
    bool tokenNeeded = true,
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(
        baseUrl ?? mainUrl + url,
        options: options,
        queryParameters: queryParams,
      );
      log("url => ${mainUrl+url}");
      log("get response => $response");
      return response;
    } on DioException catch (error, stracktrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future<Response> put(
    String url,
    Map<String, dynamic> params, {
    bool tokenNeeded = true,
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response;
    try {
      response = await dio.put(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      return response;
    } on DioException catch (error, stracktrace) {
      throw RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      throw RequestException(
        method: "/PUT",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }

  Future<Response> delete(
    String url,
    Map<String, dynamic> params, {
    bool tokenNeeded = true,
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response;
    try {
      response = await dio.delete(
        baseUrl ?? mainUrl + url,
        data: params,
        queryParameters: queryParams,
        options: options,
      );
      return response;
    } on DioException catch (error, stracktrace) {
      throw RequestException(
        method: "/DELETE",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      throw RequestException(
        method: "/DELETE",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        data: params,
        error: error,
        trace: stracktrace,
      );
    }
  }


  Future<Response> deleteWithOutParams(
    String url, {
    bool tokenNeeded = true,
    String? errorMsg,
    String? baseUrl,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.delete(
        baseUrl ?? mainUrl + url,
        options: options,
        queryParameters: queryParams,
      );
      log("url => ${mainUrl+url}");
      log("get response => $response");
      return response;
    } on DioException catch (error, stracktrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        msg: errorMsg,
        trace: stracktrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stracktrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        msg: errorMsg,
        error: error,
        trace: stracktrace,
      );
    }
  }

}



class RequestException implements Exception {
  String url;
  String? msg;
  Object error;
  String method;
  Response? res;
  int? statusCode;
  StackTrace trace;
  dynamic data;

  RequestException({
    this.msg,
    this.res,
    this.data,
    this.statusCode,
    required this.url,
    required this.method,
    required this.error,
    required this.trace,
  }) {
    log(
      """\x1B[35m/*
    method: "$method"
    url: "$url
    statusCode: ${statusCode ?? ''}
    errorMsg: "${msg ?? ''}"
    data: ${data ?? ''}
    res: ${res ?? ''}
  */\x1B[0m""",
      name: "#RequestException",
      time: DateTime.now(),
      error: error,
      stackTrace: trace,
    );
  }

  ///[Specefic to app!] It tries to show an error msg, using the [showToast()] method!
  handleError({required String defaultMessage}) {
    try {
      final pursedData = Map.from(res?.data);
    } catch (e) {
    log(e.toString());
    }
  }
}
