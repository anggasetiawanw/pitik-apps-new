import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../utils/utils.dart';

class CardActiveDashboard extends StatelessWidget {
  final Function() onTap;
  final Function() onCheckDaily;
  final Coop coop;
  const CardActiveDashboard({required this.onTap, required this.coop, required this.onCheckDaily, super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? startDate;
    if (coop.startDate != null) {
      startDate = Convert.getDatetime(coop.startDate!);
    }
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: PitikColors.primaryLight),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (coop.farmCategory != null && coop.farmCategory!.isNotEmpty)
                  Container(
                    decoration: const BoxDecoration(color: PitikColors.greenBackground2, borderRadius: BorderRadius.all(Radius.circular(16))),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Wrap(children: [
                      PitikAsset.icon(
                        svg: UtilsApp.isBroiler(coop) ? PitikSvg.chicken : PitikSvg.egg,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        UtilsApp.isBroiler(coop) ? 'Peternakan Broiler' : 'Peternakan Layer',
                        style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                      )
                    ]),
                  ),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(
                    child: Text(
                      coop.coopName ?? '-',
                      style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: PitikColors.black),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  if (UtilsApp.isCoopNew(coop) == false)
                    Text(
                      '${coop.week} Minggu',
                      style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: PitikColors.black),
                    ),
                ]),
                Text('${coop.coopDistrict ?? '-'}, ${coop.coopCity ?? '-'}', style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText), overflow: TextOverflow.clip),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  if (startDate != null) ...[
                    Text(
                      "${coop.farmCategory == null || coop.farmCategory!.isEmpty ? '- ' : UtilsApp.isBroiler(coop) ? 'DOC-In' : 'Pullet in'} ${Convert.getYear(startDate)}-${Convert.getMonthNumber(startDate)}-${Convert.getDay(startDate)}",
                      style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black),
                    ),
                    Text('Hari ${Convert.getRangeDateToNow(startDate)}', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                  ]
                ]),
                const SizedBox(height: 16),
                if (UtilsApp.isCoopNew(coop))
                  Container(
                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: PitikColors.greenBackground),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                      child: Text('Baru', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.green)),
                    ),
                  ),
                if (!(UtilsApp.isCoopNew(coop) || coop.farmCategory == null || coop.farmCategory!.isEmpty))
                  Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.greyBackground)), color: Colors.white),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Row(children: [
                              PitikAsset.icon(
                                svg: UtilsApp.isBroiler(coop) ? PitikSvg.bw : PitikSvg.hdp,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(UtilsApp.isBroiler(coop) ? 'BW/Standar' : 'HDP/Standar', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                            ]),
                            coop.bw == null
                                ? const SizedBox()
                                : Row(children: [
                                    Text(UtilsApp.isBroiler(coop) ? UtilsApp.getBwActual(coop) : UtilsApp.getHdpActual(coop),
                                        style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: coop.bw!.actual! > coop.bw!.standard! ? PitikColors.green : PitikColors.red)),
                                    Text(' / ${UtilsApp.isBroiler(coop) ? UtilsApp.getBwStandard(coop) : UtilsApp.getHdpStandard(coop)}', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                                  ])
                          ]))),
                SizedBox(height: UtilsApp.isCoopNew(coop) ? 0 : 8),
                UtilsApp.isCoopNew(coop) || coop.farmCategory == null || coop.farmCategory!.isEmpty
                    ? const SizedBox()
                    : Container(
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.fromBorderSide(BorderSide(width: 1, color: PitikColors.greyBackground)), color: Colors.white),
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Row(children: [
                                PitikAsset.icon(
                                  svg: UtilsApp.isBroiler(coop) ? PitikSvg.ip : PitikSvg.feedIntake,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(UtilsApp.isBroiler(coop) ? 'IP/Standar' : 'Feed Intake/Standar', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                              ]),
                              coop.ip == null
                                  ? const SizedBox()
                                  : Row(children: [
                                      Text(UtilsApp.isBroiler(coop) ? UtilsApp.getIpActual(coop) : UtilsApp.getFeedIntakeActual(coop),
                                          style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: coop.ip!.actual! > coop.ip!.standard! ? PitikColors.green : PitikColors.red)),
                                      Text(' / ${UtilsApp.isBroiler(coop) ? UtilsApp.getIpStandard(coop) : UtilsApp.getFeedIntakeStandard(coop)}',
                                          style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                                    ])
                            ]))),
                if (coop.isActionNeeded != null && coop.isActionNeeded!)
                  ButtonFill(
                    provider: ProviderCreator.addButtonFillProvider(),
                    label: 'Cek Laporan Harian',
                    onClick: onCheckDaily,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
