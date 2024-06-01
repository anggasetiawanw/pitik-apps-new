import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitik_app_core/pitik_app_core.dart';

final currentProfileProvider = FutureProvider<User?>((ref) async {
  final repository = ref.watch(profileLocalRepositoryProvider);
  final eitherType = (await repository.fetchProfile());

  return eitherType.fold((l) => null, (r) => r);
});
