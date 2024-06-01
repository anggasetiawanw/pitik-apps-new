import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../routes/app_router.gr.dart';
import '../providers/layer_home_provider.dart';
import '../providers/state_layer_home/layer_home_state.dart';

class HomeLayerDashboardScreen extends ConsumerStatefulWidget {
  final Coop coop;
  const HomeLayerDashboardScreen(this.coop, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeLayerDashboardScreenState();
}

class _HomeLayerDashboardScreenState extends ConsumerState<HomeLayerDashboardScreen> {
  late Coop coop = widget.coop;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(layerHomeProvider.notifier).fetchPerformance(farmingCycleId: coop.farmingCycleId!);
    });
  }

  late DateTime? startDate = coop.startDate == null ? null : Convert.getDatetime(coop.startDate!);
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(layerHomeProvider);
    ref.listen(layerHomeProvider.select((value) => value), (LayerHomeState? previous, LayerHomeState next) {
      if (next.state == EnumLayerHomeState.failure) {
        PitikDialog.showToastError(context, next.message);
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            onPressed: () => showMenuBottomSheet(context, coop),
            backgroundColor: PitikColors.primaryOrange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PitikAsset.icon(svg: PitikSvg.floatingHome, size: 24),
                Text(
                  'Menu',
                  style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: Colors.white),
                )
              ],
            )),
        body: RefreshIndicator(
          onRefresh: () => Future.delayed(Duration.zero, () {}),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: provider.state == EnumLayerHomeState.loading
                ? const PitikLoading()
                : ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Stack(
                        children: [
                          Center(child: PitikAsset.iconCustom(svg: PitikSvg.bannerLayerDashboard, width: MediaQuery.of(context).size.width)),
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 32, left: 32),
                              child: Text('${coop.week ?? '-'} Minggu', style: PitikTextStyle.custom(fontSize: 21, fontWeight: PitikTextStyle.bold, color: Colors.white)),
                            ),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Text('Pullet In ${startDate == null ? '-' : '${Convert.getYear(startDate!)}-${Convert.getMonthNumber(startDate!)}-${Convert.getDay(startDate!)}'}',
                                  style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: Colors.white)),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Text('Hari ${startDate == null ? '-' : Convert.getRangeDateToNow(startDate!)}', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: Colors.white)),
                            ),
                          ])
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                PitikAsset.icon(svg: PitikSvg.hdp, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  'HDP/Standar',
                                  style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${provider.monitoring?.performance?.hdp == null ? '-' : provider.monitoring?.performance?.hdp!.actual!.toStringAsFixed(2)}%',
                                  style: PitikTextStyle.custom(
                                      fontSize: 16,
                                      fontWeight: PitikTextStyle.bold,
                                      color: provider.monitoring?.performance?.hdp != null && provider.monitoring!.performance!.hdp!.actual! > provider.monitoring!.performance!.hdp!.standard! ? PitikColors.green : PitikColors.red),
                                ),
                                Text(' / ${provider.monitoring?.performance?.hdp == null ? '-' : provider.monitoring!.performance?.hdp?.standard}%',
                                    style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                PitikAsset.icon(svg: PitikSvg.eggWeight, size: 24),
                                const SizedBox(width: 8),
                                Text('Egg Weight/Standar', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            ),
                            Row(
                              children: [
                                Text('${provider.monitoring?.performance?.eggWeight == null ? '-' : provider.monitoring?.performance?.eggWeight!.actual!.toStringAsFixed(2)}gr',
                                    style: PitikTextStyle.custom(
                                        fontSize: 16,
                                        fontWeight: PitikTextStyle.bold,
                                        color:
                                            provider.monitoring?.performance?.eggWeight != null && provider.monitoring!.performance!.eggWeight!.actual! > provider.monitoring!.performance!.eggWeight!.standard! ? PitikColors.green : PitikColors.red)),
                                Text(' / ${provider.monitoring?.performance?.eggWeight == null ? '-' : provider.monitoring!.performance?.eggWeight?.standard}gr',
                                    style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [PitikAsset.icon(svg: PitikSvg.eggMass, size: 24), const SizedBox(width: 8), Text('Egg Mass/Standar', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))],
                            ),
                            Row(
                              children: [
                                Text('${provider.monitoring?.performance?.eggMass == null ? '-' : provider.monitoring?.performance?.eggMass!.actual!.toStringAsFixed(2)}gr',
                                    style: PitikTextStyle.custom(
                                        fontSize: 16,
                                        fontWeight: PitikTextStyle.bold,
                                        color: provider.monitoring?.performance?.eggMass != null && provider.monitoring!.performance!.eggMass!.actual! > provider.monitoring!.performance!.eggMass!.standard! ? PitikColors.green : PitikColors.red)),
                                Text(' / ${provider.monitoring?.performance?.eggMass == null ? '-' : provider.monitoring!.performance?.eggMass?.standard}gr',
                                    style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                PitikAsset.icon(svg: PitikSvg.feedIntake, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  'Feed Intake/Standar',
                                  style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(provider.monitoring?.performance?.feedIntake == null ? '-' : provider.monitoring!.performance!.feedIntake!.actual!.toStringAsFixed(2),
                                    style: PitikTextStyle.custom(
                                        fontSize: 16,
                                        fontWeight: PitikTextStyle.bold,
                                        color: provider.monitoring?.performance?.feedIntake != null && provider.monitoring!.performance!.feedIntake!.actual! > provider.monitoring!.performance!.feedIntake!.standard!
                                            ? PitikColors.green
                                            : PitikColors.red)),
                                Text(' / ${provider.monitoring?.performance?.feedIntake == null ? '-' : provider.monitoring!.performance?.feedIntake?.standard}',
                                    style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                PitikAsset.icon(svg: PitikSvg.mortality, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  'Mortalitas/Standar',
                                  style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('${provider.monitoring?.performance?.mortality == null ? '-' : provider.monitoring?.performance?.mortality!.actual!.toStringAsFixed(2)}%',
                                    style: PitikTextStyle.custom(
                                        fontSize: 16,
                                        fontWeight: PitikTextStyle.bold,
                                        color:
                                            provider.monitoring?.performance?.mortality != null && provider.monitoring!.performance!.mortality!.actual! > provider.monitoring!.performance!.mortality!.standard! ? PitikColors.green : PitikColors.red)),
                                Text(' / ${provider.monitoring?.performance?.mortality == null ? '-' : provider.monitoring!.performance?.mortality?.standard}%',
                                    style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                PitikAsset.icon(svg: PitikSvg.bw, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  'BW rata-rata/Standar',
                                  style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(provider.monitoring?.performance?.bw == null ? '-' : provider.monitoring!.performance!.bw!.actual!.toStringAsFixed(2),
                                    style: PitikTextStyle.custom(
                                        fontSize: 16,
                                        fontWeight: PitikTextStyle.bold,
                                        color: provider.monitoring?.performance?.bw != null && provider.monitoring!.performance!.bw!.actual! > provider.monitoring!.performance!.bw!.standard! ? PitikColors.green : PitikColors.red)),
                                Text(' / ${provider.monitoring?.performance?.bw == null ? '-' : provider.monitoring!.performance?.bw?.standard}', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                PitikAsset.icon(svg: PitikSvg.fcr, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  'FCR/Standar',
                                  style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(provider.monitoring?.performance?.fcr == null ? '-' : provider.monitoring!.performance!.fcr!.actual!.toStringAsFixed(2),
                                    style: PitikTextStyle.custom(
                                        fontSize: 16,
                                        fontWeight: PitikTextStyle.bold,
                                        color: provider.monitoring?.performance?.fcr != null && provider.monitoring!.performance!.fcr!.actual! > provider.monitoring!.performance!.fcr!.standard! ? PitikColors.green : PitikColors.red)),
                                Text(' / ${provider.monitoring?.performance?.fcr == null ? '-' : provider.monitoring!.performance?.fcr?.standard}',
                                    style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.outlineColor)), color: Colors.white),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Detail Populasi', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.bold, color: PitikColors.black)),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Populasi Awal', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        provider.monitoring?.population != null && provider.monitoring!.population!.total != null ? Convert.toCurrencyWithoutDecimal((provider.monitoring!.population!.initialPopulation ?? 0).toString(), '', '.') : '-',
                                        style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                                    const SizedBox(width: 4),
                                    Text('Ekor', style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total kematian', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(provider.monitoring?.population != null && provider.monitoring!.population!.mortality != null ? Convert.toCurrencyWithoutDecimal(provider.monitoring!.population!.mortality!.toString(), '', '.') : '-',
                                          style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                                      const SizedBox(width: 4),
                                      Text('Ekor', style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Afkir', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(provider.monitoring?.population != null && provider.monitoring!.population!.culled != null ? Convert.toCurrencyWithoutDecimal(provider.monitoring!.population!.culled!.toString(), '', '.') : '-',
                                          style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                                      const SizedBox(width: 4),
                                      Text('Ekor', style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Divider(
                                height: 1,
                                color: PitikColors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sisa Populasi', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(provider.monitoring?.population == null ? '-' : Convert.toCurrencyWithoutDecimal(provider.monitoring!.population!.total!.toString(), '', '.'),
                                          style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                                      const SizedBox(width: 4),
                                      Text('Ekor', style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ])),
                      const SizedBox(height: 70)
                    ],
                  ),
          ),
        ));
  }

  static Widget createMenu({required String title, required PitikSvg imagePath, required bool status, required Function() function, required BuildContext context, Color? customBackground}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        function();
      },
      child: Column(
        children: [
          SizedBox(
              width: 60,
              height: 50,
              child: Stack(children: [
                Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: customBackground ?? PitikColors.primaryLight2),
                      child: PitikAsset.iconCustom(svg: imagePath),
                    )),
                !status ? const SizedBox() : Positioned(right: 0, top: 0, child: Image.asset('images/alert_red_icon.png'))
              ])),
          const SizedBox(height: 2),
          Text(title, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black), textAlign: TextAlign.center)
        ],
      ),
    );
  }

  void showMenuBottomSheet(BuildContext context, Coop coop) {
    showModalBottomSheet(
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      )),
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              children: [
                Center(child: Container(width: 60, height: 4, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: PitikColors.outlineColor))),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Peternakan', style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.medium, color: PitikColors.black)),
                ),
                const SizedBox(height: 16),
                Padding(
                    // ROW 1 PETERNAKAN
                    padding: const EdgeInsets.all(16),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      createMenu(
                          title: 'Pullet in',
                          imagePath: PitikSvg.calendarCheck,
                          status: false,
                          function: () {
                            AutoRouter.of(context).push(PulletInRoute(coop: coop)).then(
                                  (value) => ref.read(layerHomeProvider.notifier).fetchPerformance(farmingCycleId: coop.farmingCycleId!),
                                );
                          },
                          context: context),
                      createMenu(
                        title: 'Laporan\nHarian',
                        imagePath: PitikSvg.report,
                        status: false,
                        function: () => AutoRouter.of(context).push(DailyReportHomeRoute(coop: coop)).then(
                              (value) => ref.read(layerHomeProvider.notifier).fetchPerformance(farmingCycleId: coop.farmingCycleId!),
                            ),
                        context: context,
                      ),
                      const SizedBox(width: 60)
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
