// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart' as _i22;
import 'package:pitik_smart_app/features/boarding/boarding_screen.dart' as _i2;
import 'package:pitik_smart_app/features/change_password/presentation/screen/change_password_screen.dart'
    as _i3;
import 'package:pitik_smart_app/features/daily_report/layer/presentation/screens/daily_report_detail_screen.dart'
    as _i4;
import 'package:pitik_smart_app/features/daily_report/layer/presentation/screens/daily_report_form_screen.dart'
    as _i5;
import 'package:pitik_smart_app/features/daily_report/layer/presentation/screens/daily_report_home_screen.dart'
    as _i6;
import 'package:pitik_smart_app/features/daily_report/layer/presentation/screens/daily_report_revision_screen.dart'
    as _i7;
import 'package:pitik_smart_app/features/dashboard/presentation/screens/dashboard_profile_about_us.dart'
    as _i1;
import 'package:pitik_smart_app/features/dashboard/presentation/screens/dashboard_profile_help.dart'
    as _i10;
import 'package:pitik_smart_app/features/dashboard/presentation/screens/dashboard_profile_license_screen.dart'
    as _i12;
import 'package:pitik_smart_app/features/dashboard/presentation/screens/dashboard_profile_privacy.dart'
    as _i14;
import 'package:pitik_smart_app/features/dashboard/presentation/screens/dashboard_profile_term_screen.dart'
    as _i19;
import 'package:pitik_smart_app/features/dashboard/presentation/screens/dashboard_screen.dart'
    as _i8;
import 'package:pitik_smart_app/features/forgot_password/presentation/screen/forgot_password_screen.dart'
    as _i9;
import 'package:pitik_smart_app/features/home/layer/presentation/screens/layer_dashboard_screen.dart'
    as _i11;
import 'package:pitik_smart_app/features/login/presentation/screens/login_screen.dart'
    as _i13;
import 'package:pitik_smart_app/features/privacy/screen/privacy_screen.dart'
    as _i15;
import 'package:pitik_smart_app/features/pullet_in/presentation/screens/pullet_in_screen.dart'
    as _i16;
import 'package:pitik_smart_app/features/register/presentation/screen/register_screen.dart'
    as _i17;
import 'package:pitik_smart_app/features/splash/presentation/screens/splash_screen.dart'
    as _i18;

abstract class $AppRouter extends _i20.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    AboutUsRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsScreen(),
      );
    },
    BoardingRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BoardingScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ChangePasswordScreen(
          key: args.key,
          isFromLogin: args.isFromLogin,
        ),
      );
    },
    DailyReportDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DailyReportDetailRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DailyReportDetailScreen(
          args.coop,
          args.report,
          key: args.key,
        ),
      );
    },
    DailyReportFormRoute.name: (routeData) {
      final args = routeData.argsAs<DailyReportFormRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DailyReportFormScreen(
          args.coop,
          args.report,
          key: args.key,
        ),
      );
    },
    DailyReportHomeRoute.name: (routeData) {
      final args = routeData.argsAs<DailyReportHomeRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DailyReportHomeScreen(
          args.coop,
          key: args.key,
        ),
      );
    },
    DailyReportRevisionRoute.name: (routeData) {
      final args = routeData.argsAs<DailyReportRevisionRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DailyReportRevisionScreen(
          coop: args.coop,
          report: args.report,
          key: args.key,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ForgotPasswordScreen(),
      );
    },
    HelpRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HelpScreen(),
      );
    },
    LayerDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<LayerDashboardRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.LayerDashboardScreen(
          args.coop,
          key: args.key,
        ),
      );
    },
    LicenseRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LicenseScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LoginScreen(),
      );
    },
    PrivacyProfileRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PrivacyProfileScreen(),
      );
    },
    PrivacyRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PrivacyScreen(),
      );
    },
    PulletInRoute.name: (routeData) {
      final args = routeData.argsAs<PulletInRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.PulletInScreen(
          coop: args.coop,
          key: args.key,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RegisterScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreen(),
      );
    },
    TermRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.TermScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsScreen]
class AboutUsRoute extends _i20.PageRouteInfo<void> {
  const AboutUsRoute({List<_i20.PageRouteInfo>? children})
      : super(
          AboutUsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BoardingScreen]
class BoardingRoute extends _i20.PageRouteInfo<void> {
  const BoardingRoute({List<_i20.PageRouteInfo>? children})
      : super(
          BoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i20.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    _i21.Key? key,
    bool isFromLogin = false,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(
            key: key,
            isFromLogin: isFromLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i20.PageInfo<ChangePasswordRouteArgs> page =
      _i20.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({
    this.key,
    this.isFromLogin = false,
  });

  final _i21.Key? key;

  final bool isFromLogin;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key, isFromLogin: $isFromLogin}';
  }
}

/// generated route for
/// [_i4.DailyReportDetailScreen]
class DailyReportDetailRoute
    extends _i20.PageRouteInfo<DailyReportDetailRouteArgs> {
  DailyReportDetailRoute({
    required _i22.Coop coop,
    required _i22.Report report,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          DailyReportDetailRoute.name,
          args: DailyReportDetailRouteArgs(
            coop: coop,
            report: report,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyReportDetailRoute';

  static const _i20.PageInfo<DailyReportDetailRouteArgs> page =
      _i20.PageInfo<DailyReportDetailRouteArgs>(name);
}

class DailyReportDetailRouteArgs {
  const DailyReportDetailRouteArgs({
    required this.coop,
    required this.report,
    this.key,
  });

  final _i22.Coop coop;

  final _i22.Report report;

  final _i21.Key? key;

  @override
  String toString() {
    return 'DailyReportDetailRouteArgs{coop: $coop, report: $report, key: $key}';
  }
}

/// generated route for
/// [_i5.DailyReportFormScreen]
class DailyReportFormRoute
    extends _i20.PageRouteInfo<DailyReportFormRouteArgs> {
  DailyReportFormRoute({
    required _i22.Coop coop,
    required _i22.Report report,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          DailyReportFormRoute.name,
          args: DailyReportFormRouteArgs(
            coop: coop,
            report: report,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyReportFormRoute';

  static const _i20.PageInfo<DailyReportFormRouteArgs> page =
      _i20.PageInfo<DailyReportFormRouteArgs>(name);
}

class DailyReportFormRouteArgs {
  const DailyReportFormRouteArgs({
    required this.coop,
    required this.report,
    this.key,
  });

  final _i22.Coop coop;

  final _i22.Report report;

  final _i21.Key? key;

  @override
  String toString() {
    return 'DailyReportFormRouteArgs{coop: $coop, report: $report, key: $key}';
  }
}

/// generated route for
/// [_i6.DailyReportHomeScreen]
class DailyReportHomeRoute
    extends _i20.PageRouteInfo<DailyReportHomeRouteArgs> {
  DailyReportHomeRoute({
    required _i22.Coop coop,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          DailyReportHomeRoute.name,
          args: DailyReportHomeRouteArgs(
            coop: coop,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyReportHomeRoute';

  static const _i20.PageInfo<DailyReportHomeRouteArgs> page =
      _i20.PageInfo<DailyReportHomeRouteArgs>(name);
}

class DailyReportHomeRouteArgs {
  const DailyReportHomeRouteArgs({
    required this.coop,
    this.key,
  });

  final _i22.Coop coop;

  final _i21.Key? key;

  @override
  String toString() {
    return 'DailyReportHomeRouteArgs{coop: $coop, key: $key}';
  }
}

/// generated route for
/// [_i7.DailyReportRevisionScreen]
class DailyReportRevisionRoute
    extends _i20.PageRouteInfo<DailyReportRevisionRouteArgs> {
  DailyReportRevisionRoute({
    required _i22.Coop coop,
    required _i22.Report report,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          DailyReportRevisionRoute.name,
          args: DailyReportRevisionRouteArgs(
            coop: coop,
            report: report,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyReportRevisionRoute';

  static const _i20.PageInfo<DailyReportRevisionRouteArgs> page =
      _i20.PageInfo<DailyReportRevisionRouteArgs>(name);
}

class DailyReportRevisionRouteArgs {
  const DailyReportRevisionRouteArgs({
    required this.coop,
    required this.report,
    this.key,
  });

  final _i22.Coop coop;

  final _i22.Report report;

  final _i21.Key? key;

  @override
  String toString() {
    return 'DailyReportRevisionRouteArgs{coop: $coop, report: $report, key: $key}';
  }
}

/// generated route for
/// [_i8.DashboardScreen]
class DashboardRoute extends _i20.PageRouteInfo<void> {
  const DashboardRoute({List<_i20.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i20.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HelpScreen]
class HelpRoute extends _i20.PageRouteInfo<void> {
  const HelpRoute({List<_i20.PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LayerDashboardScreen]
class LayerDashboardRoute extends _i20.PageRouteInfo<LayerDashboardRouteArgs> {
  LayerDashboardRoute({
    required _i22.Coop coop,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          LayerDashboardRoute.name,
          args: LayerDashboardRouteArgs(
            coop: coop,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LayerDashboardRoute';

  static const _i20.PageInfo<LayerDashboardRouteArgs> page =
      _i20.PageInfo<LayerDashboardRouteArgs>(name);
}

class LayerDashboardRouteArgs {
  const LayerDashboardRouteArgs({
    required this.coop,
    this.key,
  });

  final _i22.Coop coop;

  final _i21.Key? key;

  @override
  String toString() {
    return 'LayerDashboardRouteArgs{coop: $coop, key: $key}';
  }
}

/// generated route for
/// [_i12.LicenseScreen]
class LicenseRoute extends _i20.PageRouteInfo<void> {
  const LicenseRoute({List<_i20.PageRouteInfo>? children})
      : super(
          LicenseRoute.name,
          initialChildren: children,
        );

  static const String name = 'LicenseRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LoginScreen]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute({List<_i20.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PrivacyProfileScreen]
class PrivacyProfileRoute extends _i20.PageRouteInfo<void> {
  const PrivacyProfileRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PrivacyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyProfileRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PrivacyScreen]
class PrivacyRoute extends _i20.PageRouteInfo<void> {
  const PrivacyRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PrivacyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PulletInScreen]
class PulletInRoute extends _i20.PageRouteInfo<PulletInRouteArgs> {
  PulletInRoute({
    required _i22.Coop coop,
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          PulletInRoute.name,
          args: PulletInRouteArgs(
            coop: coop,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PulletInRoute';

  static const _i20.PageInfo<PulletInRouteArgs> page =
      _i20.PageInfo<PulletInRouteArgs>(name);
}

class PulletInRouteArgs {
  const PulletInRouteArgs({
    required this.coop,
    this.key,
  });

  final _i22.Coop coop;

  final _i21.Key? key;

  @override
  String toString() {
    return 'PulletInRouteArgs{coop: $coop, key: $key}';
  }
}

/// generated route for
/// [_i17.RegisterScreen]
class RegisterRoute extends _i20.PageRouteInfo<void> {
  const RegisterRoute({List<_i20.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i19.TermScreen]
class TermRoute extends _i20.PageRouteInfo<void> {
  const TermRoute({List<_i20.PageRouteInfo>? children})
      : super(
          TermRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}
