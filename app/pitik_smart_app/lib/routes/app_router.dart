import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
// @override
// replaceInRouteName

  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true, path: '/splash-screen'),
        AutoRoute(page: LoginRoute.page, path: '/login-screen'),
        AutoRoute(page: DashboardRoute.page, path: '/dashboard-screen'),
        AutoRoute(page: AboutUsRoute.page, path: '/about-us-screen'),
        AutoRoute(page: HelpRoute.page, path: '/help-screen'),
        AutoRoute(page: LicenseRoute.page, path: '/license-screen'),
        AutoRoute(page: PrivacyProfileRoute.page, path: '/PrivacyProfile-screen'),
        AutoRoute(page: TermRoute.page, path: '/term-screen'),
        AutoRoute(page: RegisterRoute.page, path: '/register-screen'),
        AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password-screen'),
        AutoRoute(page: ChangePasswordRoute.page, path: '/change-password-screen'),
        AutoRoute(page: PrivacyRoute.page, path: '/privacy-screen'),
        AutoRoute(page: BoardingRoute.page, path: '/boarding-screen'),
        AutoRoute(page: LayerDashboardRoute.page, path: '/layer-dashboard-screen'),
        AutoRoute(page: PulletInRoute.page, path: '/pullet-in-screen'),
        AutoRoute(page: DailyReportHomeRoute.page, path: '/daily-report-home-screen'),
        AutoRoute(page: DailyReportDetailRoute.page, path: '/daily-report-detail-screen'),
        AutoRoute(page: DailyReportFormRoute.page, path: '/daily-report-form-screen'),
        AutoRoute(page: DailyReportRevisionRoute.page, path: '/daily-report-revision-screen'),
      ];
}
