import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../utils/app_string.dart';
import '../../../domain/repositories/dashboard_repositories.dart';
import 'dashboard_state.dart';

class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashboardRepository dashboardRepository;

  DashboardNotifier(
    this.dashboardRepository,
  ) : super(const DashboardState.initial());

  bool get isFetchingActive => state.stateActive != EnumDashboardState.loadingActive;
  bool get isFetchingIdle => state.stateIdle != EnumDashboardState.loadingIdle;

  Future<void> fetchCoopActive({required String farmCategory}) async {
    if (isFetchingActive) {
      state = state.copyWith(
        coopListActive: [],
        coopListActiveShown: [],
        stateActive: EnumDashboardState.loadingActive,
        isLoadingActive: true,
      );
      await _fetchCoop(farmCategory: farmCategory, farmType: AppString.ACTIVE);
    } else {
      state = state.copyWith(
        stateActive: EnumDashboardState.fetchDataActive,
        message: 'Sedang Fetch Data',
        isLoadingActive: false,
      );
    }
  }

  Future<void> fetchCoopIdle({required String farmCategory}) async {
    if (isFetchingIdle) {
      state = state.copyWith(
        coopListIdle: [],
        stateIdle: EnumDashboardState.loadingIdle,
        isLoadingIdle: true,
      );
      await _fetchCoop(farmCategory: farmCategory, farmType: AppString.IDLE);
    } else {
      state = state.copyWith(
        stateIdle: EnumDashboardState.fetchDataIdle,
        message: 'Sedang Fetch Data',
        isLoadingIdle: false,
      );
    }
  }

  Future<void> _fetchCoop({required String farmCategory, required String farmType}) async {
    final response = await dashboardRepository.fetchCoop(farmCategory: farmCategory, farmType: farmType);
    updateStateFromResponse(response, farmType == AppString.ACTIVE);
  }

  Future<void> searchCoopActive({required String name, required String farmCategory}) async {
    if (isFetchingActive || isFetchingIdle) {
      state = state.copyWith(
        coopListActive: [],
        stateActive: EnumDashboardState.loadingActive,
        isLoadingActive: true,
      );

      await _searchCoop(name: name, farmCategory: farmCategory, farmType: AppString.ACTIVE);
    } else {
      state = state.copyWith(
        stateActive: EnumDashboardState.fetchDataActive,
        message: 'Sedang Fetch Data',
        isLoadingActive: false,
      );
    }
  }

  Future<void> searchCoopIdle({required String name, required String farmCategory}) async {
    if (isFetchingActive || isFetchingIdle) {
      state = state.copyWith(
        stateActive: EnumDashboardState.loadingActive,
        isLoadingIdle: true,
      );

      await _searchCoop(name: name, farmCategory: farmCategory, farmType: AppString.IDLE);
    } else {
      state = state.copyWith(
        stateActive: EnumDashboardState.fetchDataIdle,
        message: 'Sedang Fetch Data',
        isLoadingActive: false,
      );
    }
  }

  Future<void> _searchCoop({required String name, required String farmCategory, required farmType}) async {
    if (isFetchingActive || isFetchingIdle) {
      state = state.copyWith(
        stateActive: EnumDashboardState.loadingActive,
        isLoadingActive: true,
      );

      final response = await dashboardRepository.searchCoop(farmCategory: farmCategory, name: name, farmType: farmType);

      updateStateFromResponse(response, farmType == AppString.ACTIVE);
    } else {
      state = state.copyWith(
        stateActive: farmType == 'active' ? EnumDashboardState.fetchDataActive : EnumDashboardState.fetchDataIdle,
        message: 'Sedang Fetch Data',
        isLoadingActive: false,
      );
    }
  }

  void updateStateFromResponse(Either<AppException, PaginatedResponse<dynamic>> response, bool isActive) {
    response.fold((failure) {
      if (isActive) {
        state = state.copyWith(
          stateActive: EnumDashboardState.failure,
          message: failure.message,
          isLoadingActive: false,
          isLoadingIdle: false,
        );
      } else {
        state = state.copyWith(
          stateIdle: EnumDashboardState.failure,
          message: failure.message,
          isLoadingActive: false,
          isLoadingIdle: false,
        );
      }
    }, (data) {
      final coopList = data.data as List<Coop>;

      if (isActive) {
        state = state.copyWith(
          coopListActive: coopList,
          coopListActiveShown: coopList,
          coopListActiveShownSeacrh: coopList,
          message: coopList.isEmpty ? 'Tidak Ada Kandang Aktif' : '',
          stateActive: EnumDashboardState.loaded,
          hasDataActive: isActive,
          hasDataIdle: !isActive,
          isLoadingActive: false,
        );
      } else {
        state = state.copyWith(
          coopListIdle: coopList,
          message: coopList.isEmpty ? 'Tidak Ada Kandang Rehat' : '',
          stateIdle: EnumDashboardState.loaded,
          hasDataActive: !isActive,
          hasDataIdle: isActive,
          isLoadingIdle: false,
        );
      }
    });
  }

  void idlePage() {
    state = state.copyWith(
      stateActive: EnumDashboardState.idlePage,
      stateIdle: EnumDashboardState.idlePage,
    );
  }

  void searchDataActive(String query) {
    final coopList = state.coopListActiveShown.where((element) => element.coopName!.toLowerCase().contains(query.toLowerCase())).toList();
    state = state.copyWith(
      coopListActiveShownSeacrh: coopList,
      isSearch: true,
    );
  }

  void filterData(String query) {
    if (query == 'Semua') {
      state = state.copyWith(
        coopListActiveShown: state.coopListActive,
      );
      return;
    }
    final coopList = state.coopListActive.where((element) => element.farmName! == query).toList();
    state = state.copyWith(
      coopListActiveShown: coopList,
    );
  }

  void searchDataIdle(String query) {
    final coopList = state.coopListIdle.where((element) => element.coopName!.toLowerCase().contains(query.toLowerCase())).toList();
    state = state.copyWith(
      coopListIdle: coopList,
      isSearch: true,
    );
  }

  void removeSearchActive() {
    state = state.copyWith(
      coopListActiveShownSeacrh: state.coopListActiveShown,
      isSearch: false,
    );
  }

  void removeSearchIdle() {
    state = state.copyWith(
      coopListActiveShownSeacrh: state.coopListIdle,
      isSearch: false,
    );
  }

  void resetState() {
    state = const DashboardState.initial();
  }
}
