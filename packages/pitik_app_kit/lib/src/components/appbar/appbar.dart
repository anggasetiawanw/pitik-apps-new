import 'package:flutter/material.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';

class PitikAppBar extends StatelessWidget {
  final String title;
  final String subTitile;
  final String description;
  final bool hideSubtitle;
  final Function()? onBackPressed;
  final List<PopupMenuEntry<String>>? actionBars;
  const PitikAppBar({super.key, required this.title, this.subTitile = '', this.hideSubtitle = true, this.onBackPressed, this.actionBars, this.description = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), color: PitikColors.primaryOrange),
        child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onBackPressed ?? () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text(title, style: PitikTextStyle.custom().copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                actionBars != null
                    ? PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        itemBuilder: (BuildContext context) => actionBars!,
                      )
                    : const SizedBox(width: 16)
              ],
            ),
            if (!hideSubtitle) ...[
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 16),
                Text(subTitile,
                    style: PitikTextStyle.custom().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 6),
                Text(description, style: PitikTextStyle.custom().copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white))
              ])
            ]
          ]),
        ));
  }
}
