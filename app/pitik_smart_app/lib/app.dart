import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import 'flavors.dart';
import 'routes/route.dart';

class PitikSmartApp extends ConsumerWidget {
  PitikSmartApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkService = ref.read(networkServiceProvider);
    networkService.setUrl(F.uri);
    return PitikComponentInit(
      builder: (_) => MaterialApp.router(
        title: 'Pitik - Smart Farming App',
        theme: PitikTheme.light(ThemeData.light()).themeData,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
          appRouter,
          navigatorObservers: () => [
            PitikRouteObserver(),
            ChuckerFlutter.navigatorObserver,
          ],
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
