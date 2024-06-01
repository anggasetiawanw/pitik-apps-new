import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

class BottomSheetNotifier extends StateNotifier<int> {
  @override
  BottomSheetNotifier() : super(0);

  void cangePosition(int position) {
    // optional: state = const AsyncLoading();
    state = position;
  }

  void initialPosition() {
    state = 0;
  }
}

final bottomSheetNotifier = StateNotifierProvider<BottomSheetNotifier, int>((ref) {
  return BottomSheetNotifier();
});
