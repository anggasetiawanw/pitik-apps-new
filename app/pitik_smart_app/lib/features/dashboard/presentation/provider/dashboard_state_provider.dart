import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/providers/dashboard_provider.dart';
import 'state/dashboard_notifier.dart';
import 'state/dashboard_state.dart';

final dashboardNotifierProvider = StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository);
});
