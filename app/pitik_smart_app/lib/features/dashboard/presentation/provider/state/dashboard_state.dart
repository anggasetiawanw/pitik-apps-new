import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumDashboardState {
  initial,
  loadingActive,
  loadingIdle,
  loaded,
  failure,
  fetchDataActive,
  fetchDataIdle,
  idlePage,
}

class DashboardState extends Equatable {
  final List<Coop> coopListActive;
  final List<Coop> coopListActiveShown;
  final List<Coop> coopListActiveShownSeacrh;
  final List<Coop> coopListIdle;
  final bool hasDataActive;
  final bool hasDataIdle;
  final EnumDashboardState stateActive;
  final EnumDashboardState stateIdle;
  final String message;
  final bool isLoadingActive;
  final bool isLoadingIdle;
  final bool isSearch;
  const DashboardState({
    this.coopListActiveShown = const [],
    this.coopListActiveShownSeacrh = const [],
    this.coopListActive = const [],
    this.coopListIdle = const [],
    this.isLoadingActive = false,
    this.isLoadingIdle = false,
    this.hasDataActive = false,
    this.hasDataIdle = false,
    this.stateActive = EnumDashboardState.initial,
    this.stateIdle = EnumDashboardState.initial,
    this.message = '',
    this.isSearch = false,
  });

  const DashboardState.initial({
    this.coopListActiveShown = const [],
    this.coopListActiveShownSeacrh = const [],
    this.coopListActive = const [],
    this.coopListIdle = const [],
    this.isLoadingActive = false,
    this.isLoadingIdle = false,
    this.hasDataActive = false,
    this.hasDataIdle = false,
    this.stateActive = EnumDashboardState.initial,
    this.stateIdle = EnumDashboardState.initial,
    this.message = '',
    this.isSearch = false,
  });

  DashboardState copyWith({
    List<Coop>? coopListActive,
    List<Coop>? coopListActiveShown,
    List<Coop>? coopListActiveShownSeacrh,
    List<Coop>? coopListIdle,
    bool? hasDataActive,
    bool? hasDataIdle,
    EnumDashboardState? stateActive,
    EnumDashboardState? stateIdle,
    String? message,
    bool? isLoadingActive,
    bool? isLoadingIdle,
    bool? isSearch,
  }) {
    return DashboardState(
      isLoadingActive: isLoadingActive ?? this.isLoadingActive,
      isLoadingIdle: isLoadingIdle ?? this.isLoadingIdle,
      coopListActive: coopListActive ?? this.coopListActive,
      coopListIdle: coopListIdle ?? this.coopListIdle,
      hasDataActive: hasDataActive ?? this.hasDataActive,
      hasDataIdle: hasDataIdle ?? this.hasDataIdle,
      stateActive: stateActive ?? this.stateActive,
      stateIdle: stateIdle ?? this.stateIdle,
      message: message ?? this.message,
      coopListActiveShown: coopListActiveShown ?? this.coopListActiveShown,
      coopListActiveShownSeacrh: coopListActiveShownSeacrh ?? this.coopListActiveShownSeacrh,
      isSearch: isSearch ?? this.isSearch,
    );
  }

  @override
  String toString() {
    return 'DashboardState(coopListActive: ${coopListActive.length}, coopListActiveShown: ${coopListActiveShown.length}, coopListActiveShownSeacrh: ${coopListActiveShownSeacrh.length}, coopListIdle: $coopListIdle, hasDataActive: $hasDataActive, hasDataIdle: $hasDataIdle, stateActive: $stateActive, stateIdle: $stateIdle, message: $message, isLoadingActive: $isLoadingActive, isLoadingIdle: $isLoadingIdle, isSearch: $isSearch)';
  }

  @override
  List<Object?> get props => [coopListActive, coopListIdle, hasDataActive, hasDataIdle, stateActive, stateIdle, message];
}
