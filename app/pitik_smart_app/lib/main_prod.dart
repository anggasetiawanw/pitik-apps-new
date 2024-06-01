import 'package:flutter/foundation.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.PROD;
  ChuckerFlutter.showOnRelease = kDebugMode ? true : false;
  await runner.main();
}
