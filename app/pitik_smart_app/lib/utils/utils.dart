import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

class UtilsApp {
  static User _user = User();

  static bool isCoopNew(Coop coop) => coop.isNew != null && coop.isNew!;
  static bool isBroiler(Coop coop) => coop.farmCategory == 'BROILER';
  static String getHdpActual(Coop coop) => coop.hdp == null || coop.hdp!.actual == null ? '-' : coop.hdp!.actual!.toStringAsFixed(1);
  static String getHdpStandard(Coop coop) => coop.hdp == null || coop.hdp!.standard == null ? '-' : coop.hdp!.standard!.toStringAsFixed(1);
  static String getBwActual(Coop coop) => coop.bw == null || coop.bw!.actual == null ? '-' : coop.bw!.actual!.toStringAsFixed(1);
  static String getBwStandard(Coop coop) => coop.bw == null || coop.bw!.standard == null ? '-' : coop.bw!.standard!.toStringAsFixed(1);
  static String getFeedIntakeActual(Coop coop) => coop.feedIntake == null || coop.feedIntake!.actual == null ? '-' : coop.feedIntake!.actual!.toStringAsFixed(1);
  static String getFeedIntakeStandard(Coop coop) => coop.feedIntake == null || coop.feedIntake!.standard == null ? '-' : coop.feedIntake!.standard!.toStringAsFixed(1);
  static String getIpActual(Coop coop) => coop.ip == null || coop.ip!.actual == null ? '-' : coop.ip!.actual!.toStringAsFixed(1);
  static String getIpStandard(Coop coop) => coop.ip == null || coop.ip!.standard == null ? '-' : coop.ip!.standard!.toStringAsFixed(1);

  static User setProfile(User user) => _user = user;
  static User getProfile() => _user;
}
