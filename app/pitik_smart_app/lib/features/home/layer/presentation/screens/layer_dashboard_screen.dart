import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../utils/utils.dart';
import 'home_layer_dashboard_screen.dart';

@RoutePage()
class LayerDashboardScreen extends ConsumerWidget {
  final Coop coop;
  const LayerDashboardScreen(this.coop, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned(top: 0, left: 0, right: 0, child: Container(height: 150, decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), color: PitikColors.primaryLight))),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: PitikColors.redBackground),
                        child: Row(
                          children: [
                            Text(
                              '${coop.coopName} (${coop.week} Minggu)',
                              style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.red),
                            ),
                            const SizedBox(width: 16),
                            PitikAsset.icon(svg: PitikSvg.arrowDiagonalRed, size: 12),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 58,
            left: 16,
            right: 16,
            child: Text('Halo ${UtilsApp.getProfile().fullName}', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: Colors.black)),
          ),
          Positioned.fill(top: 90, left: 0, right: 0, child: HomeLayerDashboardScreen(coop))
        ],
      ),
    ));
  }
}
