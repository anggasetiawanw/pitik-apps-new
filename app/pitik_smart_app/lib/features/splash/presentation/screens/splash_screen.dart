import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../routes/app_router.gr.dart';
import '../../../../utils/utils.dart';
import '../providers/splash_provider.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final isUserLoggedIn = await ref.read(userLoginCheckProvider.future);
      final networkService = ref.read(networkServiceProvider);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool isFirstLaunchApp = prefs.getBool(APP_FIRST_LAUNCH_APP_KEY) ?? true;
      if (isFirstLaunchApp) {
        await prefs.setBool(APP_FIRST_LAUNCH_APP_KEY, false);
        unawaited(AutoRouter.of(context).pushAndPopUntil(
          const BoardingRoute(),
          predicate: (_) => false,
        ));
      } else {
        if (isUserLoggedIn) {
          final userImpl = await ref.read(userCredentialsProvider.future);
          await userImpl.fold((failure) {
            unawaited(AutoRouter.of(context).pushAndPopUntil(
              const LoginRoute(),
              predicate: (_) => false,
            ));
          }, (user) async {
            final profileImpl = await ref.read(profileProviders.future);
            profileImpl.fold((failure) {
              unawaited(AutoRouter.of(context).pushAndPopUntil(
                const LoginRoute(),
                predicate: (_) => false,
              ));
            }, (profile) {
              UtilsApp.setProfile(profile);
              networkService.updateHeader({
                'Authorization': user.token,
                'X-ID': user.id,
              });
              unawaited(AutoRouter.of(context).pushAndPopUntil(
                const DashboardRoute(),
                predicate: (_) => false,
              ));
            });
          });
        } else {
          unawaited(AutoRouter.of(context).pushAndPopUntil(
            const LoginRoute(),
            predicate: (_) => false,
          ));
        }
      }
      // ignore: use_build_context_synchronously
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PitikColors.primaryOrange,
      body: Center(
        child: SizedBox(
            child: PitikAsset.icon(
          svg: PitikSvg.logoPplWhite,
          size: 200,
        )),
      ),
    );
  }
}
