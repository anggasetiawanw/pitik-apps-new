import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

abstract class DashboardRepository {
  Future<Either<AppException, PaginatedResponse<Coop>>> fetchCoop({required String farmCategory, required farmType});
  Future<Either<AppException, PaginatedResponse<Coop>>> searchCoop({required String name, required String farmCategory, required farmType});
  Future<Either<AppException, Response>> deleteDevice();
}
