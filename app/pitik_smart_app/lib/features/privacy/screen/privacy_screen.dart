import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../routes/app_router.dart';
import '../../../routes/app_router.gr.dart';

@RoutePage()
class PrivacyScreen extends ConsumerStatefulWidget {
  const PrivacyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends ConsumerState<PrivacyScreen> {
  final AppRouter appRouter = AppRouter();
  final ScrollController scrollController = ScrollController();
  late ButtonFill btAgree;
  @override
  void initState() {
    super.initState();
    btAgree = ButtonFill(
      provider: ProviderCreator.addButtonFillProvider(),
      label: 'Saya Setuju',
      statusShowOnInit: false,
      onClick: () => callButton(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(btAgree.getProvider()).disable();
      scrollController.addListener(() {
        if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
          ref.read(btAgree.getProvider()).enable();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomNavBar() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Color.fromARGB(20, 158, 157, 157), blurRadius: 5, offset: Offset(0.75, 0.0))],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                ),
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: btAgree,
              ),
            ],
          ));
    }

    Widget appBar() {
      return AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () async {
              unawaited(AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (_) => false));
              final AuthRepository authRepository = ref.watch(userLocalRepositoryProvider);
              await authRepository.deleteUser();
            }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        backgroundColor: PitikColors.primaryOrange,
        centerTitle: true,
        title: Text(
          'Kebijakan Privasi',
          style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.medium),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.only(top: 16, bottom: 100),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Kebijakan Privasi\nPitik Digital Indonesia',
                      style: PitikTextStyle.custom(fontSize: 16, fontWeight: FontWeight.w500, color: PitikColors.primaryOrange),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Center(
                      child: Text(
                        'Terakhir di perbarui 17 Des 2022 - 10:00',
                        style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Html(data: PitikString.privacyPolicy),
                  )
                ],
              ),
            ),
          ),
          bottomNavBar()
        ],
      ),
    );
  }

  Future<void> callButton() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(APP_FIRST_LOGIN_STORAGE_KEY, false);
    unawaited(AutoRouter.of(context).pushAndPopUntil(const DashboardRoute(), predicate: (_) => false));
  }
}
