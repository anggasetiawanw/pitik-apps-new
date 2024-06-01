import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../routes/app_router.gr.dart';
import '../../../dashboard/presentation/provider/bottom_state_provider.dart';
import '../provider/login_provider.dart';
import '../provider/state/login_state.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      loginStateNotifierProvider.select((value) => value),
      (previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          Navigator.of(context).pop();
          PitikDialog.showToastError(context, next.exception.message.toString());
        } else if (next is Success) {
          PitikDialog.showToastSuccess(context, 'Login Berhasil');
          ref.read(bottomSheetNotifier.notifier).initialPosition();
          AutoRouter.of(context).pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
        } else if (next is Loading) {
          PitikDialog.showLoadingDialog(context);
        } else if (next is IsFirstLogin) {
          PitikDialog.showToastSuccess(context, 'Login Berhasil');
          ref.read(bottomSheetNotifier.notifier).initialPosition();
          AutoRouter.of(context).pushAndPopUntil(
            const PrivacyRoute(),
            predicate: (_) => false,
          );
        } else if (next is IsDefaultPassword) {
          PitikDialog.showToastSuccess(context, 'Login Berhasil');
          ref.read(bottomSheetNotifier.notifier).initialPosition();
          PitikDialog.showInfoDialog(context, 'Kata Sandi bawaan harus segera ganti', () => AutoRouter.of(context).pushAndPopUntil(ChangePasswordRoute(isFromLogin: true), predicate: (_) => false));
        }
      },
    );

    final EditField phoneNumberField = EditField(
      tag: 'efPhoneNumberLogin',
      provider: ProviderCreator.addEditFieldNotifier(),
      label: 'Nomor Handphone',
      hint: '08xxxxxxxxxxx',
      alertText: 'Nomor telepon tidak valid',
      textUnit: '',
      maxInput: 100,
      onTyping: (value, edit) {},
    );
    final EditField passwordField = EditField(
      tag: 'efPasswordLogin',
      provider: ProviderCreator.addEditFieldNotifier(),
      label: 'Password',
      hint: 'Masukan password anda',
      alertText: 'Password tidak valid',
      textUnit: '',
      maxInput: 100,
      obscure: true,
      onTyping: (value, edit) {},
    );
    final ButtonFill loginButton = ButtonFill(
      provider: ProviderCreator.addButtonFillProvider(),
      label: 'Masuk',
      onClick: () {
        final String username = ref.read(phoneNumberField.getProvider()).getInput();
        final String password = ref.read(passwordField.getProvider()).getInput();
        if (username.isNotEmpty && password.isNotEmpty) {
          ref.read(loginStateNotifierProvider.notifier).loginUser(username, password);
        } else if (username.isEmpty) {
          ref.read(phoneNumberField.provider(phoneNumberField.tag)).showAlert();
        } else if (password.isEmpty) {
          ref.read(passwordField.provider(passwordField.tag)).showAlert();
        }
      },
    );
    final ButtonOutline registerButton = ButtonOutline(
      provider: ProviderCreator.addButtonOutlineProvider(),
      label: 'Bergabung menjadi Kawan Pitik!',
      // onClick: () => AutoRouter.of(context).push(const RegisterRoute()),
      onClick: () => PitikDialog.showInfoDialog(context, 'Fitur sedang dalam perbaikan', () => null),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: PitikAsset.icon(
                    svg: PitikSvg.logoFill,
                    size: 96,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Login',
                  style: PitikTextStyle.heading(
                    color: PitikColors.primaryOrange,
                  ),
                ),
                const SizedBox(height: 16),
                phoneNumberField,
                passwordField,
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const SizedBox(),
                  GestureDetector(
                    onTap: () => PitikDialog.showInfoDialog(context, 'Fitur sedang dalam perbaikan', () => null),
                    child: Text('Lupa Kata Sandi?', style: PitikTextStyle.body(color: PitikColors.primaryOrange)),
                  )
                ]),
                const SizedBox(height: 32),
                loginButton,
                registerButton,
              ],
            ),
          ),
        ],
      )),
    );
  }
}
