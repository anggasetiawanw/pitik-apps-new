import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../domain/providers/pullet_in_domain_provider.dart';
import 'state/pullet_in_notifier.dart';
import 'state/pullet_in_state.dart';

final pulletInNotifierProvider = StateNotifierProvider<PulletInNotifier, PulletInState>((ref) {
  final repository = ref.watch(pulletInRepositoryProvider);
  return PulletInNotifier(repository);
});
