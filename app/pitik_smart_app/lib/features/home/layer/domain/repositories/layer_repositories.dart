import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class LayerRepository {
  Future<Either<AppException, Monitoring>> getLayerMonitoringData({required String farmingCycleId});
}
