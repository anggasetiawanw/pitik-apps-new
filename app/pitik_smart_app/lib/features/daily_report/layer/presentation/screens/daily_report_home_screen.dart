import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../routes/app_router.gr.dart';
import '../providers/daily_report_provider.dart';
import '../providers/enum_daily_report.dart';
import '../providers/state/home/daily_report_home_state.dart';
import '../widgets/status_daily_report.dart';

@RoutePage()
class DailyReportHomeScreen extends ConsumerStatefulWidget {
  final Coop coop;
  const DailyReportHomeScreen(this.coop, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DailyReportHomeScreenState();
}

class _DailyReportHomeScreenState extends ConsumerState<DailyReportHomeScreen> {
  late Coop coop = widget.coop;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dailyReportHomeNotifierProvider.notifier).fetchListReport(farmingCycleId: coop.farmingCycleId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(dailyReportHomeNotifierProvider);
    ref.listen(dailyReportHomeNotifierProvider.select((value) => value), (DailyReportHomeState? previous, DailyReportHomeState next) {
      if (next.state == EnumDailyReportHomeState.error) {
        PitikDialog.showToastError(context, next.message);
      }
    });

    Widget listCard(Report? report) {
      return GestureDetector(
        onTap: () {
          if (report.status == EnumDailyReport.FILL_SOON) {
            AutoRouter.of(context).push(DailyReportFormRoute(coop: coop, report: report)).then((value) => ref.read(dailyReportHomeNotifierProvider.notifier).fetchListReport(farmingCycleId: coop.farmingCycleId!));
          } else {
            // Get.toNamed(controller.coop!.farmCategory == 'LAYER' ? RoutePage.layerDailyReportDetail : RoutePage.dailyReportDetail, arguments: [controller.coop!, report])!.then((value) => controller.getDailyReport());
            AutoRouter.of(context).push(DailyReportDetailRoute(coop: coop, report: report)).then((value) => ref.read(dailyReportHomeNotifierProvider.notifier).fetchListReport(farmingCycleId: coop.farmingCycleId!));
          }
        },
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: PitikColors.outlineColor)),
          child: Row(
            children: [
              PitikAsset.iconCustom(
                svg: report?.status == EnumDailyReport.REVIEW_SOON || report?.status == EnumDailyReport.FILL_SOON || report?.status == EnumDailyReport.FILLED || report?.status == EnumDailyReport.REVIEWED
                    ? PitikSvg.historyActive
                    : report?.status == EnumDailyReport.FINISHED
                        ? PitikSvg.checkboxCircleGreen
                        : PitikSvg.alertIcon,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Laporan Harian', style: PitikTextStyle.custom(fontWeight: FontWeight.bold, color: PitikColors.black)),
                          const SizedBox(height: 4),
                          Text(
                            '${report?.date}',
                            style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.black),
                          ),
                        ],
                      ),
                      StatusDailyReport(status: report!.status!)
                    ]),
                    const SizedBox(height: 8),
                    Text('Laporan harian ${report.status}', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: PitikAppBar(
          title: 'Laporan Harian',
          subTitile: '${coop.coopName}',
          description: 'Pullet In ${Convert.getDate(coop.startDate)}',
          hideSubtitle: false,
        ),
      ),
      body: provider.state == EnumDailyReportHomeState.loading
          ? const PitikLoading()
          : RawScrollbar(
              thumbColor: PitikColors.primaryOrange,
              radius: const Radius.circular(8),
              child: RefreshIndicator(
                color: PitikColors.primaryOrange,
                onRefresh: () => Future.delayed(
                  const Duration(milliseconds: 200),
                  () => ref.read(dailyReportHomeNotifierProvider.notifier).fetchListReport(farmingCycleId: coop.farmingCycleId!),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: provider.listReport.length,
                    itemBuilder: (context, index) => listCard(
                      provider.listReport[index],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
