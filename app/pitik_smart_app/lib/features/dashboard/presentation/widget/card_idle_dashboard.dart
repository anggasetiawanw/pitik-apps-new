import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../utils/app_string.dart';
import '../../../../utils/utils.dart';

class CardIdleDashboard extends StatelessWidget {
  final Coop coop;
  final Function() actionCoop;
  const CardIdleDashboard({required this.coop, required this.actionCoop, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: UtilsApp.isBroiler(coop) ? actionCoop : null,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: PitikColors.primaryLight),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              coop.farmCategory != null && coop.farmCategory!.isNotEmpty
                  ? Container(
                      decoration: const BoxDecoration(color: PitikColors.greenBackground2, borderRadius: BorderRadius.all(Radius.circular(16))),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Wrap(
                        children: [
                          PitikAsset.icon(svg: UtilsApp.isBroiler(coop) ? PitikSvg.chicken : PitikSvg.egg, size: 16),
                          const SizedBox(width: 8),
                          Text(UtilsApp.isBroiler(coop) ? 'Peternakan Broiler' : 'Peternakan Layer', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                        ],
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 12),
              Text(coop.coopName!, style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: PitikColors.black)),
              Text('${coop.coopDistrict!}, ${coop.coopCity!}', style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: coop.statusText == AppString.SUBMISSION_STATUS || coop.statusText == AppString.OVK_REJECTED || coop.statusText == AppString.REJECTED
                        ? PitikColors.redBackground
                        : coop.statusText == AppString.SUBMITTED_STATUS || coop.statusText == AppString.SUBMITTED_OVK || coop.statusText == AppString.SUBMITTED_DOC_IN || coop.statusText == AppString.NEED_APPROVED
                            ? PitikColors.primaryLight2
                            : coop.statusText == AppString.APPROVED || coop.statusText == AppString.NEW
                                ? PitikColors.greenBackground
                                : coop.statusText == AppString.PROSESSING
                                    ? PitikColors.primaryLight3
                                    : Colors.transparent),
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    child: coop.statusText == AppString.SUBMISSION_STATUS || coop.statusText == AppString.OVK_REJECTED || coop.statusText == AppString.REJECTED
                        ? Text(coop.statusText!, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.red))
                        : coop.statusText == AppString.SUBMITTED_STATUS || coop.statusText == AppString.SUBMITTED_OVK || coop.statusText == AppString.SUBMITTED_DOC_IN || coop.statusText == AppString.NEED_APPROVED
                            ? Text(coop.statusText!, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.primaryOrange))
                            : coop.statusText == AppString.APPROVED || coop.statusText == AppString.NEW
                                ? Text(coop.statusText!, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.green))
                                : coop.statusText == AppString.PROSESSING
                                    ? Text(coop.statusText!, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.yellow))
                                    : const SizedBox()),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
