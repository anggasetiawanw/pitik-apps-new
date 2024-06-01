import 'package:pitik_app_core/domain/models/coop/coop_model.dart';
import 'package:pitik_app_core/domain/models/either.dart';
import 'package:pitik_app_core/domain/models/paginated_response.dart';
import 'package:pitik_app_core/domain/models/response.dart';
import 'package:pitik_app_core/exceptions/http_exception.dart';

import '../../domain/repositories/dashboard_repositories.dart';
import '../datasource/dashboard_remote_datasource.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  DashboardDatassource dashboardDatasSource;
  DashboardRepositoryImpl(this.dashboardDatasSource);

  @override
  Future<Either<AppException, PaginatedResponse<Coop>>> fetchCoop({required String farmCategory, required farmType}) {
    return dashboardDatasSource.fetchCoop(farmCategory: farmCategory, farmType: farmType);
  }

  @override
  Future<Either<AppException, PaginatedResponse<Coop>>> searchCoop({required String name, required String farmCategory, required farmType}) {
    return dashboardDatasSource.searchCoop(name: name, farmCategory: farmCategory, farmType: farmType);
  }

  @override
  Future<Either<AppException, Response>> deleteDevice() {
    return dashboardDatasSource.deleteDevice();
  }
}
