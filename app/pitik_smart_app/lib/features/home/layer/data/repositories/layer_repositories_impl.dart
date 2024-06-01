import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/monitoring/monitoring_model.dart';
import 'package:pitik_app_core/exceptions/http_exception.dart';

import '../../domain/repositories/layer_repositories.dart';
import '../datasource/layer_remote_datasource.dart';

class LayerRepositoryImpl extends LayerRepository {
  final LayerDatasource datasource;

  LayerRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, Monitoring>> getLayerMonitoringData({required String farmingCycleId}) {
    return datasource.getLayerMonitoringData(farmingCycleId: farmingCycleId);
  }
}
