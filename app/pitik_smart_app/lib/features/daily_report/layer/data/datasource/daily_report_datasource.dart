import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class DailyReportDataSource {
  Future<Either<AppException, PaginatedResponse<Report>>> getListDailyReport({required String farmingCycleId});
  Future<Either<AppException, Report>> getDetailReport({required String farmingCycleId, required String date});
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file});
  Future<Either<AppException, PaginatedResponse<Product>>> getProductBrand({required String keyword, required String categoryName});
  Future<Either<AppException, Report>> addReport({required String farmingCycleId, required String date, required Report payload});
  Future<Either<AppException, dynamic>> requestDailyReportRevision({required String farmingCycleId, required String date, required DailyReportRevision payload});
}

class DailyReportRemoteDatasource implements DailyReportDataSource {
  final NetworkService networkService;
  const DailyReportRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, PaginatedResponse<Report>>> getListDailyReport({required String farmingCycleId}) async {
    final response = await networkService.get(
      'v2/farming-cycles/$farmingCycleId/daily-reports',
    );

    return response.fold((exception) => Left(exception), (res) {
      try {
        final jsonData = res.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchDataDailyReport',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final List<Report> reports = jsonData.map<Report>((report) => Report.fromJson(report)).toList();

        final paginatedResponse = PaginatedResponse<Report>.fromJson(jsonData, reports);
        return Right(paginatedResponse);
      } catch (e) {
        return Left(
          AppException(
            message: 'Unknown error occurred',
            statusCode: 1,
            identifier: '${e.toString()}\nLayerRemoteDatasource.getLayerMonitoringData',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, Report>> getDetailReport({required String farmingCycleId, required String date}) async {
    try {
      final response = await networkService.get(
        'v2/farming-cycles/$farmingCycleId/daily-reports/$date',
      );
      return response.fold((exception) => Left(exception), (response) {
        final report = Report.fromJson(response.data);
        return Right(report);
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
  Future<Either<AppException, Report>> addReport({required String farmingCycleId, required String date, required Report payload}) async {
    try {
      final response = await networkService.post(
        'v2/farming-cycles/$farmingCycleId/daily-reports/$date',
        data: payload.toJson(),
      );
      return response.fold((exception) => Left(exception), (response) {
        final report = Report.fromJson(response.data);
        return Right(report);
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
  Future<Either<AppException, PaginatedResponse<Product>>> getProductBrand({required String keyword, required String categoryName}) async {
    final response = await networkService.get(
      'v2/products/search',
      queryParameters: {
        'productName': keyword,
        'categoryName': categoryName,
        '\$page': 1,
        '\$limit': 10,
      },
    );

    return response.fold((exception) => Left(exception), (res) {
      try {
        final jsonData = res.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchDataDailyReport',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final List<Product> products = jsonData.map<Product>((product) => Product.fromJson(product)).toList();

        final paginatedResponse = PaginatedResponse<Product>.fromJson(jsonData, products);
        return Right(paginatedResponse);
      } catch (e) {
        return Left(
          AppException(
            message: 'Unknown error occurred getProductBrand',
            statusCode: 1,
            identifier: '${e.toString()}\nLayerRemoteDatasource.getLayerMonitoringData',
          ),
        );
      }
    });
  }

  @override
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file}) async {
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
      final response = await networkService.post('v2/upload', formData: formData, queryParameters: {'folder': 'transfer-request'});
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

  @override
  Future<Either<AppException, dynamic>> requestDailyReportRevision({required String farmingCycleId, required String date, required DailyReportRevision payload}) async {
    try {
      final response = await networkService.post(
        'v2/farming-cycles/$farmingCycleId/daily-reports/$date/revision',
        data: payload.toJson(),
      );
      return response.fold(
        (exception) => Left(exception),
        (response) => Right(response.data),
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
