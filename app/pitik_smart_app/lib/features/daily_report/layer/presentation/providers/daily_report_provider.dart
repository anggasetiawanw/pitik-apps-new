import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/provider/daily_report_provider.dart';
import 'state/detail/daily_report_detail_notifider.dart';
import 'state/detail/daily_report_detail_state.dart';
import 'state/form/daily_report_form_notifier.dart';
import 'state/form/daily_report_form_state.dart';
import 'state/home/daily_report_home_notifier.dart';
import 'state/home/daily_report_home_state.dart';
import 'state/revision/daily_report_revision_notifier.dart';
import 'state/revision/daily_report_revision_state.dart';

final dailyReportHomeNotifierProvider = StateNotifierProvider<DailyReportHomeNotifier, DailyReportHomeState>((ref) {
  final repository = ref.watch(dailyReportRepositoryProvider);
  return DailyReportHomeNotifier(repository);
});

final dailyReportDetailNotifierProvider = StateNotifierProvider<DailyReportDetailNotifier, DailyReportDetailState>((ref) {
  final repository = ref.watch(dailyReportRepositoryProvider);
  return DailyReportDetailNotifier(repository);
});

final dailyReportFormNotifierProvider = StateNotifierProvider<DailyReportFormNotifier, DailyReportFormState>((ref) {
  final repository = ref.watch(dailyReportRepositoryProvider);
  return DailyReportFormNotifier(repository);
});

final dailyReportRevisionNotifierProvider = StateNotifierProvider<DailyReportRevisionNotifier, DailyReportRevisionState>((ref) {
  final repository = ref.watch(dailyReportRepositoryProvider);
  return DailyReportRevisionNotifier(repository);
});
