import 'dart:io';

import 'package:pitik_app_core/domain/models/either.dart';

import 'package:pitik_app_core/domain/models/media_upload/media_upload_model.dart';

import 'package:pitik_app_core/domain/models/request_chickin/request_chickin_model.dart';

import 'package:pitik_app_core/exceptions/http_exception.dart';

import '../../domain/repositories/pullet_in_repository.dart';
import '../datasource/pullet_in_datasource.dart';

class PulletInRepositoryImpl extends PulletInRepository {
    PulletInDatasource datasource;
    PulletInRepositoryImpl(this.datasource);
  @override
  Future<Either<AppException, RequestChickin>> createRequestChickin({required RequestChickin requestChickin, required String farmingCycleId}) {
    return datasource.createRequestChickin(requestChickin: requestChickin, farmingCycleId: farmingCycleId);
  }

  @override
  Future<Either<AppException, RequestChickin>> getRequestChickin({required String farmingCycleId}) {
    return datasource.getRequestChickin(farmingCycleId: farmingCycleId);
  }

  @override
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file}) {
    return datasource.uploadMedia(file: file);
  }
}
