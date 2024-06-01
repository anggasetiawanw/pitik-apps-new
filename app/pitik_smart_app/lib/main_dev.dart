import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import 'flavors.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.DEV;
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = true;
  await runner.main();
}
