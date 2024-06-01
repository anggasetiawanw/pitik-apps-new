import 'dart:io';

import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class DailyReportRepository {
  Future<Either<AppException, PaginatedResponse<Report>>> getListDailyReport({required String farmingCycleId});
  Future<Either<AppException, Report>> getDetailReport({required String farmingCycleId, required String date});
  Future<Either<AppException, PaginatedResponse<Product>>> getFeedBrand({required String keyword});
  Future<Either<AppException, PaginatedResponse<Product>>> getOvk({required String keyword});
  Future<Either<AppException, Report>> addReport({required String farmingCycleId, required String date, required Report payload});
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file});
  Future<Either<AppException, dynamic>> requestDailyReportRevision({required String farmingCycleId, required String date, required DailyReportRevision payload});
}
