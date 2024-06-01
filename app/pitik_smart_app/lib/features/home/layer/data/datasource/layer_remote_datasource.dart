import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class LayerDatasource {
  Future<Either<AppException, Monitoring>> getLayerMonitoringData({required String farmingCycleId});
}

class LayerRemoteDatasource implements LayerDatasource {
  final NetworkService networkService;

  LayerRemoteDatasource(this.networkService);

  @override
  Future<Either<AppException, Monitoring>> getLayerMonitoringData({required String farmingCycleId}) async {
    try {
      final eitherType = await networkService.get(
        'v2/farming-cycles/${farmingCycleId}/performance',
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final monitoring = Monitoring.fromJson(response.data);
          return Right(monitoring);
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
