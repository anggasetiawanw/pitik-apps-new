import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pitik_app_core/log/log.dart';

class PitikRouteObserver extends AutoRouteObserver {
  Log log = Log();
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log.console('', type: LogType.debug);
    log.console(
      'InitTabRoute: ${route.name}; from: ${previousRoute?.name}\n',
      type: LogType.debug,
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log.console('', type: LogType.debug);
    log.console(
      'ChangeTabRoute: ${route.name}; from: ${previousRoute.name}\n',
      type: LogType.debug,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.console('', type: LogType.debug);
    log.console(
      'Pop: ${route.settings.name}; from: ${previousRoute?.settings.name}\n',
      type: LogType.debug,
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.console('', type: LogType.debug);
    log.console(
      'Push: ${route.settings.name}; from: ${previousRoute?.settings.name}\n',
      type: LogType.debug,
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log.console('', type: LogType.debug);
    log.console(
      'Remove: ${route.settings.name}; from: ${previousRoute?.settings.name}\n',
      type: LogType.debug,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log.console('', type: LogType.debug);
    log.console(
      'Replace: ${newRoute?.settings.name}; from: ${oldRoute?.settings.name}\n',
      type: LogType.debug,
    );
  }
}
