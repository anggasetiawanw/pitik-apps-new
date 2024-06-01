import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_core/pitik_app_core.dart';

final currentUserProvider = FutureProvider<Auth?>((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final eitherType = (await repository.fetchUser());

  return eitherType.fold((l) => null, (r) => r);
});
