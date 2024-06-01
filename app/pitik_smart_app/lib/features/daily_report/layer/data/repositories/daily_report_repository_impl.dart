import 'dart:io';

import 'package:pitik_app_core/domain/models/daily_report_revision/daily_report_revision_model.dart';
import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';
import 'package:pitik_app_core/domain/models/paginated_response.dart';
import 'package:pitik_app_core/domain/models/product/product_model.dart';
import 'package:pitik_app_core/domain/models/report/report_model.dart';
import 'package:pitik_app_core/exceptions/http_exception.dart';

import '../../domain/repositories/daily_report_repository.dart';
import '../datasource/daily_report_datasource.dart';

class DailyReportRepositoryImpl extends DailyReportRepository {
  final DailyReportDataSource dataSource;
  DailyReportRepositoryImpl(this.dataSource);
  @override
  Future<Either<AppException, PaginatedResponse<Report>>> getListDailyReport({required String farmingCycleId}) {
    return dataSource.getListDailyReport(farmingCycleId: farmingCycleId);
  }
  
  @override
  Future<Either<AppException, Report>> getDetailReport({required String farmingCycleId, required String date}) {
    return dataSource.getDetailReport(farmingCycleId: farmingCycleId, date: date);
  }

  @override
  Future<Either<AppException, Report>> addReport({required String farmingCycleId, required String date, required Report payload}) {
    return dataSource.addReport(farmingCycleId: farmingCycleId, date: date, payload: payload);
  }

  @override
  Future<Either<AppException, PaginatedResponse<Product>>> getFeedBrand({required String keyword}) {
    return dataSource.getProductBrand(keyword: keyword, categoryName: 'PAKAN');
  }

  @override
  Future<Either<AppException, PaginatedResponse<Product>>> getOvk({required String keyword}) {
    return dataSource.getProductBrand(keyword: keyword, categoryName: 'OVK');
  }

  @override
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file}) {
    return dataSource.uploadMedia(file: file);
  }

  @override
  Future<Either<AppException, dynamic>> requestDailyReportRevision({required String farmingCycleId, required String date, required DailyReportRevision payload}) {
    return dataSource.requestDailyReportRevision(farmingCycleId: farmingCycleId, date: date, payload: payload);
  }
}
