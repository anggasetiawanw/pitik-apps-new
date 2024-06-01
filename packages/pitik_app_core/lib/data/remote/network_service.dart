import 'package:dio/dio.dart';
import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/response.dart' as res;
import 'package:pitik_app_core/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);
  void setUrl(String url);

  Future<Either<AppException, res.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, res.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, res.Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, res.Response>> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, res.Response>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
  });
}
