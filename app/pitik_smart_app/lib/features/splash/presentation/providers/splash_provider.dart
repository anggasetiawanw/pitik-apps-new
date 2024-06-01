import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

final userLoginCheckProvider = FutureProvider((ref) async {
  final repo = ref.watch(userLocalRepositoryProvider);
  return await repo.hasUser();
});

final userCredentialsProvider = FutureProvider((ref) async {
  final repo = ref.watch(userLocalRepositoryProvider);
  return await repo.fetchUser();
});

final profileProviders =FutureProvider((ref) async{
  final profile = ref.watch(profileLocalRepositoryProvider);
  return await profile.fetchProfile();
});