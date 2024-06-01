import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../provider/bottom_state_provider.dart';
import 'dashboard_home.dart';
import 'dashboard_profile.dart';

@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we'll use [AutoTabsRouter] to handle tab navigation
    final state = ref.watch(bottomSheetNotifier);

    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return const DashboardHomeScreen();
        case 1:
          return const DashboardProfileScreen();
        default:
          return const SizedBox();
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 3)],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: PitikAsset.icon(svg: PitikSvg.homeActive, size: 24),
                  icon: PitikAsset.icon(svg: PitikSvg.homeInactive, size: 24),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  activeIcon: PitikAsset.icon(svg: PitikSvg.profileActive, size: 24),
                  icon: PitikAsset.icon(svg: PitikSvg.profileInactive, size: 24),
                  label: 'Profile',
                ),
              ],
              currentIndex: state,
              selectedItemColor: PitikColors.primaryOrange,
              unselectedItemColor: PitikColors.grey,
              showUnselectedLabels: true,
              onTap: (index) {
                // change current tab
                ref.read(bottomSheetNotifier.notifier).cangePosition(index);
              },
            ),
          )),
      body: buildContent(state),
    );
  }
}
