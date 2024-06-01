import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components.dart';

class ProviderCreator {
  static AutoDisposeChangeNotifierProviderFamily<ButtonFillNotifier, String> addButtonFillProvider({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<ButtonFillNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return ButtonFillNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<ButtonOutlineNofitier, String> addButtonOutlineProvider({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<ButtonOutlineNofitier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return ButtonOutlineNofitier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<EditFieldNotifier, String> addEditFieldNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<EditFieldNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return EditFieldNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<PassswordNotifier, String> addPasswordFieldNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<PassswordNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return PassswordNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<SearchBarNotifier, String> addSearchBarNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<SearchBarNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }

      return SearchBarNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<DateTimeFieldNotifier, String> addDateFieldNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<DateTimeFieldNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return DateTimeFieldNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<MediaFieldNotifier, String> addMediaFieldNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<MediaFieldNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return MediaFieldNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<AccordionFieldNotifier, String> addAccordionFieldNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<AccordionFieldNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return AccordionFieldNotifier(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<MultipleFormFieldNotifier, String> addMultipleFormFieldNotifier<T>({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<MultipleFormFieldNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return MultipleFormFieldNotifier<T>(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<SuggestFieldNotifier, String> addSuggestFieldNotifier<T>({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<SuggestFieldNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return SuggestFieldNotifier<T>(arg: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<ExpandableNotifier, String> addExpandableNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<ExpandableNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return ExpandableNotifier(tag: arg);
    });
  }

  static AutoDisposeChangeNotifierProviderFamily<CheckBoxNotifier, String> addCheckBoxNotifier({bool? isKeepAlive}) {
    return ChangeNotifierProvider.autoDispose.family<CheckBoxNotifier, String>((ref, arg) {
      if (isKeepAlive == true) {
        ref.keepAlive();
      }
      ref.onAddListener(() {
        Future.delayed(const Duration(minutes: 30), () {
          ref.invalidateSelf();
        });
      });
      return CheckBoxNotifier(arg: arg);
    });
  }
}
