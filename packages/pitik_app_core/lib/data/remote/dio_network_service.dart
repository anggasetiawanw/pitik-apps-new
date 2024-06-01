import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pitik_app_core/configs/app_config.dart';
// import 'package:pitik_app_core/app_configs.dart';
import 'package:pitik_app_core/data/remote/network_service.dart';
import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/response.dart' as response;
import 'package:pitik_app_core/exceptions/http_exception.dart';
import 'package:pitik_app_core/mixins/exception_handler_mixin.dart';
import 'package:pitik_app_core/shared/globals.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  static List<Interceptor> defaultInterceptors = [
    PrettyDioLogger(
      maxWidth: 100,
      requestHeader: true,
      requestBody: true,
    ),
  ];

  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      dio.interceptors.add(ChuckerDioInterceptor());
      if (kDebugMode) {
        dio.interceptors.addAll(defaultInterceptors);
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint, {Map<String, dynamic>? data, FormData? formData, Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data ?? formData,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  void setUrl(String url) {
    dio.options.baseUrl = url;
  }

  @override
  Future<Either<AppException, response.Response>> delete(String endpoint, {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.delete(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> patch(String endpoint, {Map<String, dynamic>? data, FormData? formData, Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.patch(
        endpoint,
        data: data ?? formData,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> put(String endpoint, {Map<String, dynamic>? data, FormData? formData, Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.put(
        endpoint,
        data: data ?? formData,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
