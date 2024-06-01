// ignore_for_file: must_be_immutable, slash_for_doc_comments, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_kit/pitik_app_kit.dart';
import 'package:pitik_app_kit/src/components/expandable/accordion.dart';

/// @author DICKY
/// @email <dicky.maulana@pitik.id>
/// @create date 14/09/2023

class Expandable extends ConsumerWidget {
  final AutoDisposeChangeNotifierProviderFamily<ExpandableNotifier, String> provider;
  Widget child;
  String headerText;
  bool expanded;
  Widget? titleWidget;
  Color titleBackgroundColorExpand;
  Color titleBackgroundColorCollapse;
  Color titleBorderColor;

  Expandable(
      {super.key,
      required this.provider,
      required this.headerText,
      this.expanded = false,
      required this.child,
      this.titleWidget,
      this.titleBackgroundColorExpand = const Color(0xFFFDDAA5),
      this.titleBackgroundColorCollapse = const Color(0xFFFDDAA5),
      this.titleBorderColor = const Color(0xFFFDDAA5)});

  AutoDisposeChangeNotifierProvider<ExpandableNotifier> getProvider() {
    return provider(headerText);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getProvider());

    return Accordion(
      margin: EdgeInsets.zero,
      title: titleWidget != null ? null : headerText,
      textStyle: PitikTextStyle.custom(fontWeight: PitikTextStyle.medium, color: PitikColors.black),
      onToggleCollapsed: (isExpand) {
        if (isExpand) {
          ref.read(getProvider().notifier).expand();
        } else {
          ref.read(getProvider().notifier).collapse();
        }
      },
      titleChild: titleWidget,
      collapsedTitleBackgroundColor: titleBackgroundColorCollapse,
      expandedTitleBackgroundColor: titleBackgroundColorExpand,
      showAccordion: controller.expanded,
      collapsedIcon: PitikAsset.iconCustom(svg: PitikSvg.arrowDown),
      expandedIcon: PitikAsset.iconCustom(svg: PitikSvg.arrowUp),
      titleBorder: Border.all(
        color: titleBorderColor,
      ),
      titleBorderRadius: controller.expanded ? const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)) : const BorderRadius.all(Radius.circular(10)),
      contentBorder: const Border(
        bottom: BorderSide(color: PitikColors.outlineColor, width: 1),
        left: BorderSide(color: PitikColors.outlineColor, width: 1),
        right: BorderSide(color: PitikColors.outlineColor, width: 1),
        top: BorderSide(color: PitikColors.outlineColor, width: 0.1),
      ),
      contentBorderRadius: controller.expanded ? const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)) : const BorderRadius.all(Radius.circular(10)),
      contentChild: child,
    );
  }
}
