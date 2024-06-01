import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class PulletInDatasource {
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file});
  Future<Either<AppException, RequestChickin>> getRequestChickin({required String farmingCycleId});
  Future<Either<AppException, RequestChickin>> createRequestChickin({required RequestChickin requestChickin, required String farmingCycleId});
}

class PulletInRemoteDatasource implements PulletInDatasource {
  NetworkService networkService;
  PulletInRemoteDatasource({required this.networkService});
  @override
  Future<Either<AppException, RequestChickin>> createRequestChickin({required RequestChickin requestChickin, required String farmingCycleId}) async {
    try {
      final response = await networkService.patch(
        'v2/farming-cycles/$farmingCycleId/doc-in',
        data: requestChickin.toJson(),
      );
      return response.fold((exception) => Left(exception), (response) {
        final requestChickin = RequestChickin.fromJson(response.data);
        return Right(requestChickin);
      });
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLayerRemoteDatasource.getLayerMonitoringData',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, RequestChickin>> getRequestChickin({required String farmingCycleId}) async {
    try {
      final response = await networkService.get('v2/farming-cycles/$farmingCycleId/doc-in');
      return response.fold((exception) => Left(exception), (response) {
        final requestChickin = RequestChickin.fromJson(response.data);
        return Right(requestChickin);
      });
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLayerRemoteDatasource.getLayerMonitoringData',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, MediaUploadModel>> uploadMedia({
    required File file,
  }) async {
    try {
      final String fileName = file.path.split('/').last;
      final FormData formData = FormData.fromMap(
        {
          'file': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );
      final response = await networkService.post('v2/upload', formData: formData, queryParameters: {'folder': 'goods-receipt-purchase-order'});
      return response.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final media = MediaUploadModel.fromJson(response.data);
          return Right(media);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLayerRemoteDatasource.getLayerMonitoringData',
        ),
      );
    }
  }
}
