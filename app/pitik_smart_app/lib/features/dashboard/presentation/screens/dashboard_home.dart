import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../routes/app_router.gr.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/utils.dart';
import '../provider/dashboard_state_provider.dart';
import '../provider/state/dashboard_state.dart';
import '../widget/card_active_dashboard.dart';
import '../widget/card_idle_dashboard.dart';

class DashboardHomeScreen extends ConsumerStatefulWidget {
  const DashboardHomeScreen({super.key});

  @override
  ConsumerState<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends ConsumerState<DashboardHomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  final scrollController = ScrollController();
  final scrollController2 = ScrollController();
  bool isSearchActive = false;
  Timer? _debounce;

  late SearchBarField searchBarField;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    searchBarField = SearchBarField(
      provider: ProviderCreator.addSearchBarNotifier(isKeepAlive: true),
      hint: 'Cari Kandang',
      items: ['Semua'],
      addPrefixDropdown: true,
      onTyping: (value, prov) {
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
        }
        _debounce = Timer(const Duration(milliseconds: 500), () {
          if (value.isNotEmpty && value.length > 1) {
            if (tabController.index == 0) {
              ref.read(dashboardNotifierProvider.notifier).searchDataActive(value);
            } else {
              ref.read(dashboardNotifierProvider.notifier).searchDataIdle(value);
            }
          } else {
            if (tabController.index == 0) {
              ref.read(dashboardNotifierProvider.notifier).removeSearchActive();
            } else {
              ref.read(dashboardNotifierProvider.notifier).removeSearchIdle();
            }
          }
        });
      },
      onCategorySelected: (categorySelected) {
        ref.read(dashboardNotifierProvider.notifier).filterData(categorySelected);
      },
    );

    tabListener();
    Future.delayed(const Duration(milliseconds: 200), () {
      ref.read(dashboardNotifierProvider.notifier).fetchCoopActive(farmCategory: AppString.LAYER);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void tabListener() {
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        if (tabController.index == 0) {
          ref.read(dashboardNotifierProvider.notifier).fetchCoopActive(farmCategory: AppString.LAYER);
        } else {
          ref.read(dashboardNotifierProvider.notifier).fetchCoopIdle(farmCategory: AppString.LAYER);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = ref.watch(dashboardNotifierProvider);

    ref.listen(
      dashboardNotifierProvider.select((value) => value),
      (DashboardState? previous, DashboardState next) {
        //show Snackbar on failure
        if (next.stateActive == EnumDashboardState.fetchDataActive) {
          if (next.message.isNotEmpty) {
            PitikDialog.showToastError(context, next.message.toString());
          }
        } else if (next.stateIdle == EnumDashboardState.fetchDataIdle) {
          if (next.message.isNotEmpty) {
            PitikDialog.showToastError(context, next.message.toString());
          }
        } else if (next.stateActive == EnumDashboardState.loaded && previous?.stateActive != next.stateActive) {
          logDebug('Data Active Loaded');
          if (next.coopListActive.isNotEmpty) {
            final List<String> itemsFromCoop = next.coopListActive.map((e) => e.farmName!).toSet().toList();
            final List<String> items = ['Semua', ...itemsFromCoop];
            ref.read(searchBarField.getProvider().notifier).generateItem(items);
          }
        } else if (next.stateIdle == EnumDashboardState.loaded && previous?.stateIdle != next.stateIdle) {
          logDebug('Data Idle Loaded');
          if (next.coopListIdle.isNotEmpty) {
            final List<String> itemsFromCoop = next.coopListIdle.map((e) => e.coopName!).toSet().toList();
            final List<String> items = ['Semua', ...itemsFromCoop];
            logDebug('items: $items');
            ref.read(searchBarField.getProvider().notifier).generateItem(items);
          }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: searchBarField,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 50,
              height: 34,
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 5,
                    child: PitikAsset.icon(svg: PitikSvg.notification, size: 24),
                  ),
                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: PitikColors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        '${0}',
                        style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                indicatorColor: PitikColors.primaryOrange,
                labelColor: PitikColors.primaryOrange,
                unselectedLabelColor: PitikColors.grey,
                labelStyle: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium),
                unselectedLabelStyle: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium),
                tabs: const [Tab(text: 'Kandang Aktif'), Tab(text: 'Kandang Rehat')]),
          ),
          const SizedBox(height: 8),
          Expanded(
              child: TabBarView(physics: const NeverScrollableScrollPhysics(), controller: tabController, children: [
            dashboardProvider.stateActive == EnumDashboardState.loadingActive
                ? const PitikLoading()
                : dashboardProvider.coopListActive.isEmpty
                    ? const Center(child: Text('Data Kandang Tidak Ditemukan'))
                    : RefreshIndicator(
                        onRefresh: () => Future.delayed(const Duration(milliseconds: 200), () => ref.read(dashboardNotifierProvider.notifier).fetchCoopActive(farmCategory: AppString.LAYER)),
                        child: RawScrollbar(
                          controller: scrollController,
                          thumbVisibility: true,
                          thumbColor: PitikColors.primaryOrange,
                          radius: const Radius.circular(8),
                          child: ListView.builder(
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: dashboardProvider.isSearch ? dashboardProvider.coopListActiveShownSeacrh.length : dashboardProvider.coopListActiveShown.length,
                            itemBuilder: (context, index) => CardActiveDashboard(
                              onTap: () => actionCoop(dashboardProvider.isSearch ? dashboardProvider.coopListActiveShownSeacrh[index] : dashboardProvider.coopListActiveShown[index]),
                              coop: dashboardProvider.isSearch ? dashboardProvider.coopListActiveShownSeacrh[index] : dashboardProvider.coopListActiveShown[index],
                              onCheckDaily: () => AutoRouter.of(context).push(DailyReportHomeRoute(coop: dashboardProvider.isSearch ? dashboardProvider.coopListActiveShownSeacrh[index] : dashboardProvider.coopListActiveShown[index])).then(
                                    (value) => ref.read(dashboardNotifierProvider.notifier).fetchCoopActive(farmCategory: AppString.LAYER),
                                  ),
                            ),
                          ),
                        ),
                      ),
            dashboardProvider.stateIdle == EnumDashboardState.loadingIdle
                ? const PitikLoading()
                : dashboardProvider.coopListIdle.isEmpty
                    ? const Center(child: Text('Data Kandang Tidak Ditemukan'))
                    : RefreshIndicator(
                        onRefresh: () => Future.delayed(const Duration(milliseconds: 200), () => ref.read(dashboardNotifierProvider.notifier).fetchCoopIdle(farmCategory: AppString.LAYER)),
                        child: RawScrollbar(
                          controller: scrollController2,
                          thumbVisibility: true,
                          thumbColor: PitikColors.primaryOrange,
                          radius: const Radius.circular(8),
                          child: ListView.builder(
                            controller: scrollController2,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: dashboardProvider.coopListIdle.length,
                            itemBuilder: (context, index) => CardIdleDashboard(
                              coop: dashboardProvider.coopListIdle[index],
                              actionCoop: () {},
                            ),
                          ),
                        ),
                      ),
          ]))
        ],
      ),
    );
  }

  void actionCoop(Coop coop) {
    if (tabController.index == 0) {
      if (coop.isNew != null && coop.isNew!) {
        _showCoopAdditionalButtonSheet(coop: coop, isRestCoop: false);
      } else {
        // Get.toNamed(coop.farmCategory == 'BROILER' ? RoutePage.coopDashboard : RoutePage.layerDashboard, arguments: [coop])!.then((value) => _refreshCoopList());
        AutoRouter.of(context).push(LayerDashboardRoute(coop: coop)).then((value) => _refreshCoopList());
      }
    } else {
      _showCoopAdditionalButtonSheet(coop: coop, isRestCoop: true);
    }
  }

  void _refreshCoopList() {
    if (tabController.index == 0) {
      ref.read(dashboardNotifierProvider.notifier).fetchCoopActive(farmCategory: AppString.LAYER);
    } else {
      ref.read(dashboardNotifierProvider.notifier).fetchCoopIdle(farmCategory: AppString.LAYER);
    }
  }

  void _showCoopAdditionalButtonSheet({required Coop coop, required bool isRestCoop}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      )),
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: const EdgeInsets.only(top: 16), child: Container(width: 60, height: 4, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: PitikColors.outlineColor))),
                Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Align(alignment: Alignment.centerLeft, child: Text('Mau memulai siklus?', style: PitikTextStyle.custom(fontSize: 21, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange)))),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(UtilsApp.isBroiler(coop) ? 'Silahkan lakukan Order DOC in lalu Order dan Penerimaan Pakan-OVK' : 'Silahkan lakukan pengisian form Pullet In untuk memulai siklus',
                        style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: const Color(0xFF9E9D9D)))),
                if (UtilsApp.isBroiler(coop)) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ButtonOutline(
                      provider: ProviderCreator.addButtonOutlineProvider(),
                      label: 'Order',
                      isHaveIcon: true,
                      imageAsset: PitikSvg.document,
                      onClick: () {},
                    ),
                  ),
                  ButtonOutline(
                    provider: ProviderCreator.addButtonOutlineProvider(),
                    label: 'DOC-In',
                    isHaveIcon: true,
                    imageAsset: PitikSvg.calendarCheck,
                    onClick: () {},
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ButtonOutline(
                      provider: ProviderCreator.addButtonOutlineProvider(),
                      label: 'Pullet-In',
                      isHaveIcon: true,
                      imageAsset: PitikSvg.calendarCheck,
                      onClick: () {
                        AutoRouter.of(context).push(PulletInRoute(coop: coop)).then((value) {
                          Navigator.pop(context);
                          _refreshCoopList();
                        });
                      },
                    ),
                  )
                ],
                const SizedBox(height: 24)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logOut() async {
    final AuthRepository authRepository = ref.watch(userLocalRepositoryProvider);
    await authRepository.deleteUser();
    final ProfileRepository profileRepository = ref.watch(profileLocalRepositoryProvider);
    await profileRepository.deleteProfile();
    unawaited(AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (_) => false));
  }
}
