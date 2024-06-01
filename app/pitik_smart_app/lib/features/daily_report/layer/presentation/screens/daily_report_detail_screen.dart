import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../routes/route.dart';
import '../providers/daily_report_provider.dart';
import '../providers/state/detail/daily_report_detail_state.dart';
import '../widgets/product_card_report.dart';
import '../widgets/status_daily_report.dart';

@RoutePage()
class DailyReportDetailScreen extends ConsumerStatefulWidget {
  final Coop coop;
  final Report report;
  const DailyReportDetailScreen(
    this.coop,
    this.report, {
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DailyReportDetailScreenState();
}

class _DailyReportDetailScreenState extends ConsumerState<DailyReportDetailScreen> {
  late Report report = widget.report;
  late Coop coop = widget.coop;

  late ButtonFill bfEditOrRevisi = ButtonFill(
    provider: ProviderCreator.addButtonFillProvider(),
    label: 'Permintaan Edit',
    onClick: () async {
      final controller = ref.watch(dailyReportDetailNotifierProvider);
      if (controller.isCanRevision) {
        await AutoRouter.of(context).push(DailyReportRevisionRoute(coop: coop, report: report)).then((value) => ref.read(dailyReportDetailNotifierProvider.notifier).fetchDetailReport(farmingCycleId: coop.farmingCycleId!, report: report));
      } else if (controller.isCanEdit) {
        await AutoRouter.of(context).push(DailyReportFormRoute(coop: coop, report: report)).then((value) => ref.read(dailyReportDetailNotifierProvider.notifier).fetchDetailReport(farmingCycleId: coop.farmingCycleId!, report: report));
      }
    },
  );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dailyReportDetailNotifierProvider.notifier).resetState();
      ref.read(dailyReportDetailNotifierProvider.notifier).fetchDetailReport(farmingCycleId: coop.farmingCycleId!, report: report);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(dailyReportDetailNotifierProvider);
    ref.listen(dailyReportDetailNotifierProvider.select((value) => value), (DailyReportDetailState? previous, DailyReportDetailState next) {
      if (next.state == EnumDailyReportDetail.error) {
        PitikDialog.showToastError(context, next.message);
      } else if (next.state == EnumDailyReportDetail.loading) {
        PitikDialog.showLoadingPage(context);
      } else if (next.state == EnumDailyReportDetail.loaded) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (next.isCanRevision) {
            ref.read(bfEditOrRevisi.getProvider().notifier).changeLabel('Permintaan Edit');
          } else if (next.isCanEdit) {
            ref.read(bfEditOrRevisi.getProvider().notifier).changeLabel('Edit');
          }
          PitikDialog.closeDialog(context);
        });
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: PitikAppBar(
          title: 'Laporan Harian',
          subTitile: '${coop.coopName}',
          description: 'Laporan Harian ${Convert.getDate(report.date)}',
          hideSubtitle: false,
        ),
      ),
      bottomNavigationBar: controller.isCanEdit || controller.isCanRevision
          ? Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2)]),
              child: bfEditOrRevisi,
            )
          : null,
      //   :
      //   report.status! != EnumDailyReport.LATE && report.status! != EnumDailyReport.FINISHED && controller.report.revisionStatus != 'REVISED'
      //       ? Container(
      //           padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      //           decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2)]),
      //           child: controller.bfEdit,
      //         )
      //       : const SizedBox(),
      body: RawScrollbar(
        thumbColor: PitikColors.primaryOrange,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: PitikColors.greyBackground,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: PitikColors.outlineColor, width: 1),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Status Laporan Harian', style: PitikTextStyle.custom(color: PitikColors.black, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(report.date ?? '-', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12))
                      ]),
                      StatusDailyReport(status: report.status!)
                    ])
                  ])),
              const SizedBox(height: 16),
              Text('Produksi Ayam', style: TextStyle(color: PitikColors.black, fontSize: 14, fontWeight: PitikTextStyle.bold)),
              const SizedBox(height: 8),
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: PitikColors.outlineColor, width: 1)),
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Bobot', style: TextStyle(color: PitikColors.greyText, fontSize: 12, fontWeight: PitikTextStyle.medium)),
                      Text('${controller.report.averageWeight ?? '-'} gr', style: TextStyle(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.medium))
                    ]),
                    const SizedBox(height: 4),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Afkir', style: TextStyle(color: PitikColors.greyText, fontSize: 12, fontWeight: PitikTextStyle.medium)),
                      Text('${controller.report.culling ?? '-'} Ekor', style: TextStyle(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.medium))
                    ])
                  ])),
              const SizedBox(height: 16),
              const Divider(color: PitikColors.outlineColor, height: 1.4),
              const SizedBox(height: 16),
              controller.report.mortalityList != null && controller.report.mortalityList!.isNotEmpty
                  ? Column(children: [
                      Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: PitikColors.outlineColor, width: 1)),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  controller.report.mortalityList!.length,
                                  (index) => Column(children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            Text('Kematian', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                            const SizedBox(height: 4),
                                            Text('${controller.report.mortalityList![index]!.quantity ?? '-'} Ekor', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                                          ]),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                            Text('Alasan', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                            const SizedBox(height: 4),
                                            Text(controller.report.mortalityList![index]!.cause ?? '-', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                                          ])
                                        ]),
                                        if (index < controller.report.mortalityList!.length) ...[
                                          const SizedBox(height: 8),
                                          const Divider(color: PitikColors.outlineColor, height: 1.4),
                                          const SizedBox(height: 8),
                                        ]
                                      ])))),
                      const SizedBox(height: 16)
                    ])
                  : const SizedBox(),
              Text('Produksi Telur', style: TextStyle(color: PitikColors.black, fontSize: 14, fontWeight: PitikTextStyle.bold)),
              const SizedBox(height: 8),
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: PitikColors.outlineColor, width: 1)),
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Utuh Coklat', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Total (butir)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggQuantity(productName: 'Telur Utuh Cokelat', report: controller.report), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('Total (kg)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggWeight(productName: 'Telur Utuh Cokelat', report: controller.report), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ])
                    ]),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Utuh Krem', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Total (butir)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggQuantity(report: controller.report, productName: 'Telur Utuh Krem'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('Total (kg)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggWeight(report: controller.report, productName: 'Telur Utuh Krem'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ])
                    ]),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Retak', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Total (butir)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggQuantity(report: controller.report, productName: 'Telur Retak'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('Total (kg)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggWeight(report: controller.report, productName: 'Telur Retak'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ])
                    ]),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Pecah', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Total (butir)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggQuantity(report: controller.report, productName: 'Telur Pecah'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('Total (kg)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggWeight(report: controller.report, productName: 'Telur Pecah'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ])
                    ]),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Kotor', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Total (butir)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggQuantity(report: controller.report, productName: 'Telur Kotor'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Text('Total (kg)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                        const SizedBox(height: 4),
                        Text(getEggWeight(report: controller.report, productName: 'Telur Kotor'), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                      ])
                    ]),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Pemusnahan', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 8),
                    Text('Total (kg)', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                    const SizedBox(height: 4),
                    Text('${controller.report.eggDisposal ?? '-'} kg', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Telur Abnormal', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 8),
                    Text(controller.report.isAbnormal != null && controller.report.isAbnormal! ? 'Ya' : 'Tidak', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Text('Keterangan', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 8),
                    Text(controller.report.remarks ?? '-', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                    const SizedBox(height: 16),
                    const Divider(color: PitikColors.outlineColor, height: 1.4),
                    const SizedBox(height: 16),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Total', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                      Text(getTotal(report: controller.report), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                    ]),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Berat Total', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                      Text(getTotalWeight(report: controller.report), style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                    ])
                  ])),
              const SizedBox(height: 16),
              if (controller.report.feedConsumptions != null) ...[
                Text('Konsumsi Pakan', style: TextStyle(color: PitikColors.black, fontSize: 14, fontWeight: PitikTextStyle.bold)),
                const SizedBox(height: 8),
                ProductCardDailyreport(productList: controller.report.feedConsumptions!, isFeed: true),
                const SizedBox(height: 8),
              ],
              if (controller.report.ovkConsumptions != null) ...[
                Text('Konsumsi OVK', style: TextStyle(color: PitikColors.black, fontSize: 14, fontWeight: PitikTextStyle.bold)),
                const SizedBox(height: 8),
                ProductCardDailyreport(productList: controller.report.ovkConsumptions!, isFeed: true),
                const SizedBox(height: 16),
              ],
              Column(
                children: List.generate(
                  controller.report.images == null || controller.report.images!.isEmpty ? 0 : controller.report.images!.length,
                  (index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              controller.report.images![index] != null ? controller.report.images![index]!.url! : '',
                              width: MediaQuery.of(context).size.width - 36,
                              height: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.fill,
                            )));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getEggQuantity({required String productName, required Report report}) {
    if (report.harvestedEgg != null) {
      for (var egg in report.harvestedEgg!) {
        if (egg != null && egg.productItem?.name == productName) {
          return '${egg.quantity ?? '-'} butir';
        }
      }
    }

    return '- butir';
  }

  String getEggWeight({required String productName, required Report report}) {
    if (report.harvestedEgg != null) {
      for (var egg in report.harvestedEgg!) {
        if (egg != null && egg.productItem?.name == productName) {
          return '${egg.weight ?? '-'} kg';
        }
      }
    }
    return '- kg';
  }

  String getTotal({required Report report}) {
    double result = 0;
    if (report.harvestedEgg != null) {
      for (var egg in report.harvestedEgg!) {
        if (egg != null) {
          result += egg.quantity ?? 0;
        }
      }
    }
    return '${Convert.toCurrencyWithoutDecimal(result.toString(), '', '.')} Butir';
  }

  String getTotalWeight({required Report report}) {
    double result = 0;
    if (report.harvestedEgg != null) {
      for (var egg in report.harvestedEgg!) {
        if (egg != null) {
          result += egg.weight ?? 0;
        }
      }
    }
    return '${Convert.toCurrencyWithDecimal(result.toString(), '', '.', ',')} kg';
  }
}
