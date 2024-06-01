import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EditField efFullName = EditField(
      tag: 'efFullNameRegister',
      provider: ProviderCreator.addEditFieldNotifier(),
      label: 'Nama Lengkap',
      hint: 'Masukan nama lengkap anda',
      alertText: 'Nama tidak valid',
      textUnit: '',
      maxInput: 100,
      onTyping: (value, edit) {},
    );
    final EditField efEmail = EditField(
      tag: 'efEmailRegister',
      provider: ProviderCreator.addEditFieldNotifier(),
      label: 'Email',
      hint: 'Masukan email yang digunakan',
      alertText: 'Email tidak valid',
      textUnit: '',
      maxInput: 100,
      inputType: TextInputType.emailAddress,
      onTyping: (value, edit) {},
    );
    final EditField efPhoneNumber = EditField(
      tag: 'efPhoneNumberRegister',
      provider: ProviderCreator.addEditFieldNotifier(),
      label: 'Nomor Handphone',
      hint: '08xxxxxxxxxxx',
      alertText: 'Nomor telepon tidak valid',
      textUnit: '',
      maxInput: 100,
      inputType: TextInputType.phone,
      onTyping: (value, edit) {},
    );
    final EditField efBussinessyear = EditField(
      tag: 'efBussinessyearRegister',
      provider: ProviderCreator.addEditFieldNotifier(),
      label: 'Sudah berapa lama memilik usaha peternakan?',
      hint: 'Lama usaha peternakan',
      alertText: 'Lama usaha tidak valid',
      textUnit: '',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (value, edit) {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: PitikAppBar(title: 'Kawan Pitik', hideSubtitle: true)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Yuk Daftar Kawan Pitik!', style: PitikTextStyle.custom(color: PitikColors.primaryOrange, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Manfaatkan fitur-fitur Pitik untuk meningkatkan pendapatan dari peternakan kamu.',
                style: PitikTextStyle.custom(
                  fontSize: 12,
                  color: PitikColors.black,
                )),
            const SizedBox(height: 8),
            efFullName,
            efEmail,
            efPhoneNumber,
            efBussinessyear,
            // const SizedBox(height: 16),
            // Text('Tipe Kandang', style: TextStyle(color: GlobalVar.black, fontSize: 14, fontWeight: GlobalVar.medium)),
            // const SizedBox(height: 8),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   GestureDetector(
            //       onTap: () => controller.coopTypeState.value = 0,
            //       child: Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //           decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: controller.coopTypeState.value == 0 ? GlobalVar.primaryOrange : GlobalVar.primaryLight),
            //           child: Text('Open House', style: TextStyle(color: controller.coopTypeState.value == 0 ? Colors.white : GlobalVar.primaryOrange, fontSize: 14, fontWeight: GlobalVar.medium)))),
            //   const SizedBox(width: 8),
            //   GestureDetector(
            //       onTap: () => controller.coopTypeState.value = 1,
            //       child: Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //           decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: controller.coopTypeState.value == 1 ? GlobalVar.primaryOrange : GlobalVar.primaryLight),
            //           child: Text('Semi House', style: TextStyle(color: controller.coopTypeState.value == 1 ? Colors.white : GlobalVar.primaryOrange, fontSize: 14, fontWeight: GlobalVar.medium)))),
            //   const SizedBox(width: 8),
            //   GestureDetector(
            //       onTap: () => controller.coopTypeState.value = 2,
            //       child: Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //           decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: controller.coopTypeState.value == 2 ? GlobalVar.primaryOrange : GlobalVar.primaryLight),
            //           child: Text('Close House', style: TextStyle(color: controller.coopTypeState.value == 2 ? Colors.white : GlobalVar.primaryOrange, fontSize: 14, fontWeight: GlobalVar.medium))))
            // ]),
            // controller.efCoopCapacity,
            // controller.efLocation,
            // controller.efAddress,
            // const SizedBox(height: 16),
            // Text('Kecamatan', style: TextStyle(color: GlobalVar.black, fontSize: 14, fontWeight: GlobalVar.medium)),
            // const SizedBox(height: 8),
            // controller.googlePlaceAutoCompleteTextField,
            // controller.efCity,
            // controller.efProvince,
            // const SizedBox(height: 24),
            // ButtonFill(controller: GetXCreator.putButtonFillController('registerSend'), label: 'Kirim', onClick: () => controller.saveRegister()),
            // ButtonOutline(controller: GetXCreator.putButtonOutlineController('registerClose'), label: 'Batal', onClick: () => Get.back()),
            // const SizedBox(height: 16),
            // Center(child: Text('Dengan kamu menekan tombol kirim,\nberarti kamu setuju dengan', style: TextStyle(color: GlobalVar.black, fontSize: 12, fontWeight: GlobalVar.medium), textAlign: TextAlign.center)),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   GestureDetector(
            //     onTap: () => Get.toNamed(privacyPolicyRoute),
            //     child: Text('Kebijakan Privasi', style: TextStyle(color: GlobalVar.primaryOrange, fontSize: 12, fontWeight: GlobalVar.bold)),
            //   ),
            //   Text(' serta ', style: TextStyle(color: GlobalVar.black, fontSize: 12, fontWeight: GlobalVar.medium)),
            //   GestureDetector(
            //     onTap: () => Get.toNamed(termRoute),
            //     child: Text('Syarat & Ketentuan', style: TextStyle(color: GlobalVar.primaryOrange, fontSize: 12, fontWeight: GlobalVar.bold)),
            //   ),
            //   Text(' kami', style: TextStyle(color: GlobalVar.black, fontSize: 12, fontWeight: GlobalVar.medium))
            // ])
          ],
        ),
      ),
    );
  }
}
