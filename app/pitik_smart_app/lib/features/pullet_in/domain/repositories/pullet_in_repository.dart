import 'dart:io';

import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class PulletInRepository {
  Future<Either<AppException, MediaUploadModel>> uploadMedia({required File file});
  Future<Either<AppException, RequestChickin>> getRequestChickin({required String farmingCycleId});
  Future<Either<AppException, RequestChickin>> createRequestChickin({required RequestChickin requestChickin, required String farmingCycleId});
}
