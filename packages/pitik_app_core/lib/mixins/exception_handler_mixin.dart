import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pitik_app_core/data/remote/network_service.dart';
import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/response.dart' as response;
import 'package:pitik_app_core/exceptions/http_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>> handleException<T extends Object>(Future<Response<dynamic>> Function() handler, {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          code: res.statusCode ?? 200,
          data: res.data['data'],
          reasonPhrase: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      switch (e.runtimeType) {
        case SocketException:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case DioException:
          e as DioException;
          message = e.response?.data?['error']['message'] ?? 'Internal Error occurred';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
