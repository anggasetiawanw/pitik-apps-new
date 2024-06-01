import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class DashboardDatassource {
  Future<Either<AppException, PaginatedResponse<Coop>>> fetchCoop({required String farmCategory, required farmType});
  Future<Either<AppException, PaginatedResponse<Coop>>> searchCoop({required String name, required String farmCategory, required farmType});
  Future<Either<AppException, Response>> deleteDevice();
}

class DashboardRemoteDatasource extends DashboardDatassource {
  final NetworkService networkService;
  DashboardRemoteDatasource(this.networkService);
  @override
  Future<Either<AppException, PaginatedResponse<Coop>>> fetchCoop({required String farmCategory, required farmType}) async {
    final response = await networkService.get(
      'v2/coops/$farmType',
      queryParameters: {
        'ignoreCache': true,
        'farmCategory': farmCategory,
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchDataCoop',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final List<Coop> coops = jsonData.map<Coop>((coop) => Coop.fromJson(coop)).toList();
        final paginatedResponse = PaginatedResponse<Coop>.fromJson(jsonData, coops);
        return Right(paginatedResponse);
      },
    );
  }

  @override
  Future<Either<AppException, PaginatedResponse<Coop>>> searchCoop({required String name, required String farmCategory, required farmType}) async {
    final response = await networkService.get(
      'v2/coops/$farmType',
      queryParameters: {
        'ignoreCache': true,
        'farmCategory': farmCategory,
        'name': name,
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format.',
            ),
          );
        }
        final List<Coop> coops = jsonData.map<Coop>((coop) => Coop.fromJson(coop)).toList();
        final paginatedResponse = PaginatedResponse<Coop>.fromJson(jsonData, coops);
        return Right(paginatedResponse);
      },
    );
  }

  @override
  Future<Either<AppException, Response>> deleteDevice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String id = prefs.getString(ID_TOKEN_STORAGE_KEY) ?? '';
    final response = await networkService.delete(
      'v2/devices/$id',
    );

    return response.fold(
      (l) => Left(l),
      (r) async {
        await prefs.remove(ID_TOKEN_STORAGE_KEY);
        return Right(r);
      },
    );
  }
}
