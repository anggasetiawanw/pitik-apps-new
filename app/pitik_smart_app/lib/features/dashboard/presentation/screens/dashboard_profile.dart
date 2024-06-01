import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../utils/utils.dart';
import '../../../../routes/route.dart';
import '../../domain/providers/dashboard_provider.dart';

class DashboardProfileScreen extends ConsumerStatefulWidget {
  const DashboardProfileScreen({super.key});

  @override
  ConsumerState<DashboardProfileScreen> createState() => _DashboardProfileScreenState();
}

class _DashboardProfileScreenState extends ConsumerState<DashboardProfileScreen> {
  String? _version;
  // String? _buildNumber;
  // String? _buildSignature;
  // String? _appName;
  // String? _packageName;
  // String? _installerStore;

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final version = packageInfo.version;
    //   final buildNumber = packageInfo.buildNumber;
    //   final buildSignature = packageInfo.buildSignature;
    //   final appName = packageInfo.appName;
    //   final packageName = packageInfo.packageName;
    //   final installerStore = packageInfo.installerStore;

    setState(() {
      _version = version;
      // _buildNumber = buildNumber;
      // _buildSignature = buildSignature;
      // _appName = appName;
      // _packageName = packageName;
      // _installerStore = installerStore;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget nameInfo() {
      return Container(
        margin: const EdgeInsets.only(top: 64, left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PitikAsset.icon(
              svg: PitikSvg.pitikAvatar,
              size: 64,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${UtilsApp.getProfile().fullName}', style: PitikTextStyle.custom(fontWeight: PitikTextStyle.bold, fontSize: 16, color: PitikColors.black), overflow: TextOverflow.clip),
                const SizedBox(height: 4),
                Text(
                  UtilsApp.getProfile().roles != null ? UtilsApp.getProfile().roles!.map((e) => e.name).join(', ') : '-',
                  style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText),
                  overflow: TextOverflow.clip,
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget listComponent(Function() onTap, PitikSvg imagePath, String title) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 30, top: 24, right: 30),
          child: Row(
            children: [
              PitikAsset.iconCustom(
                svg: imagePath,
                color: PitikColors.primaryOrange,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                title,
                style: PitikTextStyle.custom(
                  fontSize: 14,
                  color: PitikColors.black,
                ),
              ),
              if (title != 'Logout') ...[const Spacer(), PitikAsset.iconCustom(svg: PitikSvg.arrowRightBlack)]
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: nameInfo()),
          Container(
            margin: const EdgeInsets.only(top: 32, left: 39, right: 39),
            child: const Divider(
              color: PitikColors.outlineColor,
              thickness: 1.6,
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                listComponent(() => AutoRouter.of(context).push(ChangePasswordRoute()), PitikSvg.key, 'Ubah Kata Sandi'),
                listComponent(() => AutoRouter.of(context).push(const PrivacyProfileRoute()), PitikSvg.privacy, 'Kebijakan Privasi'),
                listComponent(() => AutoRouter.of(context).push(const TermRoute()), PitikSvg.term, 'Syarat & Ketentuan'),
                listComponent(() => AutoRouter.of(context).push(const AboutUsRoute()), PitikSvg.information, 'Tentang Kami'),
                listComponent(() => AutoRouter.of(context).push(const HelpRoute()), PitikSvg.help, 'Bantuan'),
                listComponent(() => AutoRouter.of(context).push(const LicenseRoute()), PitikSvg.license, 'Lisensi'),
                listComponent(() {
                  PitikDialog.showLoadingDialog(context);
                  Future.delayed(const Duration(seconds: 1), () async {
                    await ref.read(dashboardRepositoryProvider).deleteDevice();
                    await ref.read(userLocalRepositoryProvider).deleteUser();
                    await ref.read(profileLocalRepositoryProvider).deleteProfile();
                    Navigator.of(context).pop();
                    unawaited(AutoRouter.of(context).replace(const LoginRoute()));
                  });
                }, PitikSvg.logout, 'Logout'),
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'V $_version',
              style: PitikTextStyle.custom(color: PitikColors.grey, fontSize: 12),
            ),
          ),
          // const SizedBox(
          //   height: 80,
          // )
        ],
        //     ),
        //   )
        // ],
      ),
    );
  }
}
