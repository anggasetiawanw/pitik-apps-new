import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../routes/app_router.gr.dart';
import '../providers/change_password_provider.dart';
import '../providers/state/change_password_state.dart';

@RoutePage()
class ChangePasswordScreen extends ConsumerWidget {
  final bool isFromLogin;
  const ChangePasswordScreen({
    super.key,
    this.isFromLogin = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      changePasswordStateNotifierProvider.select((value) => value),
      (previous, next) {
        if (next is Failure) {
          Navigator.of(context).pop();
          PitikDialog.showToastError(context, next.exception.message.toString());
        } else if (next is Success) {
          PitikDialog.showToastSuccess(context, 'Kata sandi berhasil diubah');
          AutoRouter.of(context).pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
        } else if (next is Loading) {
          PitikDialog.showLoadingDialog(context);
        }
      },
    );

    final PasswordField efOldPassword = PasswordField(
      provider: ProviderCreator.addPasswordFieldNotifier(),
      label: 'Kata Sandi Lama',
      hint: 'Masukan kata sandi lama',
      alertText: 'Kata sandi lama tidak boleh kosong',
      maxInput: 20,
      onTyping: (value, provider) {},
    );

    final PasswordField efNewPassword = PasswordField(
      provider: ProviderCreator.addPasswordFieldNotifier(),
      label: 'Kata Sandi Baru',
      hint: 'Masukan kata sandi baru',
      alertText: 'Kata sandi baru tidak boleh kosong',
      maxInput: 20,
      onTyping: (value, provider) {
        checkNewPassword(ref, value, provider);
      },
    );

    final PasswordField efConfNewPassword = PasswordField(
      provider: ProviderCreator.addPasswordFieldNotifier(),
      label: 'Konfirmasi Kata Sandi Baru',
      hint: 'Masukan kata sandi baru',
      alertText: 'Konfirmasi kata sandi baru tidak boleh kosong',
      maxInput: 20,
      onTyping: (value, provider) {},
    );

    Widget appBar() {
      return AppBar(
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (isFromLogin) {
                AutoRouter.of(context).pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
              } else {
                Navigator.pop(context);
              }
            }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
        backgroundColor: PitikColors.primaryOrange,
        centerTitle: true,
        title: Text(
          'Ubah Kata Sandi',
          style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.medium),
        ),
      );
    }

    Widget bottomNavBar() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Color.fromARGB(20, 158, 157, 157), blurRadius: 5, offset: Offset(0.75, 0.0))],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                ),
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(
                    child: ButtonFill(
                      provider: ProviderCreator.addButtonFillProvider(),
                      label: 'Simpan',
                      onClick: () => showBottomDialog(context, ref, efOldPassword, efNewPassword, efConfNewPassword),
                      tag: 'ButtonYessSheetChangePassword',
                    ),
                  )
                ]))
          ]));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBar(),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kata Sandi Baru',
                  style: PitikTextStyle.custom(fontSize: 24, fontWeight: FontWeight.bold, color: PitikColors.primaryOrange),
                ),
                const SizedBox(height: 8),
                Text(
                  'Perubahan kata sandi diperlukan untuk meningkatkan keamanan Akun Anda. Kata sandi baru Anda harus menggunakan kombinasi huruf dan angka yang unik dengan jumlah karakter minimum 6 dan maksimum 20.',
                  style: PitikTextStyle.custom(fontSize: 10, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText),
                ),
                efOldPassword,
                efNewPassword,
                efConfNewPassword,
                const SizedBox(
                  height: 90,
                )
              ],
            ),
          ),
        ),
        bottomNavBar()
      ]),
    );
  }

  Future<dynamic> showBottomDialog(BuildContext context, WidgetRef ref, PasswordField efOldPassword, PasswordField efNewPassword, PasswordField efConfNewPassword) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: PitikColors.outlineColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24, left: 16, right: 73),
                  child: Text(
                    'Apakah kamu yakin data yang dimasukan sudah benar?',
                    style: PitikTextStyle.custom(fontSize: 21, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, left: 16, right: 52),
                  child: const Text('Pastikan semua data yang kamu masukan semua sudah benar', style: TextStyle(color: Color(0xFF9E9D9D), fontSize: 12)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: PitikAsset.icon(
                    svg: PitikSvg.askBottomSheet,
                    size: 120,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ButtonFill(
                          provider: ProviderCreator.addButtonFillProvider(),
                          label: 'Ya',
                          onClick: () {
                            Navigator.pop(context);
                            saveChangePassword(ref, efOldPassword, efNewPassword, efConfNewPassword);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ButtonOutline(
                          provider: ProviderCreator.addButtonOutlineProvider(),
                          label: 'Tidak',
                          onClick: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        });
  }

  void checkNewPassword(WidgetRef ref, String value, AutoDisposeChangeNotifierProvider<PassswordNotifier> provider) {
    if (value.isEmpty) {
      ref.read(provider.notifier).showAlert();
      ref.read(provider.notifier).hideAlertLength();
      ref.read(provider.notifier).hideAlertPassword();
    } else {
      ref.read(provider.notifier).hideAlert();
      ref.read(provider.notifier).showAlertLength();
      ref.read(provider.notifier).showAlertPassword();

      if (Helper.checkLengthPassword(value)) {
        ref.read(provider.notifier).beGoodLength();
      } else {
        ref.read(provider.notifier).beBadLength();
      }

      if (Helper.checkLengthPassword(value)) {
        ref.read(provider.notifier).beGoodPassword();
      } else {
        ref.read(provider.notifier).beBadPassword();
      }
    }
  }

  void saveChangePassword(WidgetRef ref, PasswordField efOldPassword, PasswordField efNewPassword, PasswordField efConfNewPassword) {
    bool isValid = true;
    if (efConfNewPassword.getInput().isEmpty) {
      ref.read(efConfNewPassword.getProvider().notifier)
        ..setAlertText('Password Harus Di Isi')
        ..showAlert();
      Scrollable.ensureVisible(ref.watch(efConfNewPassword.getProvider().select((value) => value.formKey)).currentContext!);
      isValid = false;
    } else if (efConfNewPassword.getInput() != efNewPassword.getInput()) {
      ref.read(efConfNewPassword.getProvider().notifier)
        ..setAlertText('Password Tidak Sama')
        ..showAlert();
      Scrollable.ensureVisible(ref.watch(efConfNewPassword.getProvider().select((value) => value.formKey)).currentContext!);
      isValid = false;
    }

    if (efNewPassword.getInput().isEmpty) {
      ref.read(efNewPassword.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.watch(efNewPassword.getProvider().select((value) => value.formKey)).currentContext!);
      isValid = false;
    }

    if (efOldPassword.getInput().isEmpty) {
      ref.read(efOldPassword.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.watch(efOldPassword.getProvider().select((value) => value.formKey)).currentContext!);
      isValid = false;
    }
    if (isValid == false) {
      return;
    }

    ref.read(changePasswordStateNotifierProvider.notifier).changePasswordUser(oldPassword: efOldPassword.getInput(), newPassword: efNewPassword.getInput(), confPassword: efConfNewPassword.getInput());
  }
}
