import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../routes/route.dart';

@RoutePage()
class BoardingScreen extends ConsumerStatefulWidget {
  const BoardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BoardingState();
}

class BoardingState extends ConsumerState<BoardingScreen> {
  int state = 0;

  late ButtonFill btnNext;

  @override
  void initState() {
    super.initState();
    btnNext = ButtonFill(provider: ProviderCreator.addButtonFillProvider(), tag: 'boardingNext', label: 'Lanjut', onClick: () => _movePage());
  }

  void _movePage() {
    if (state == 0) {
      setState(() => state = 1);
    } else if (state == 1) {
      setState(() {
        state = 2;
        ref.read(btnNext.getProvider().notifier).changeLabel('Mulai');
      });
    } else if (state == 2) {
      AutoRouter.of(context).replace(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          // ignore: deprecated_member_use
          child: WillPopScope(
              onWillPop: () async {
                if (state > 0) {
                  setState(() {
                    state--;
                    ref.read(btnNext.getProvider().notifier).changeLabel('Lanjut');
                  });

                  return false;
                } else {
                  return true;
                }
              },
              child: Stack(children: [
                Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          state == 0
                              ? Container(
                                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), color: PitikColors.primaryOrange),
                                  height: 8,
                                  width: 18,
                                )
                              : Container(
                                  decoration: const BoxDecoration(color: PitikColors.grey, shape: BoxShape.circle),
                                  height: 8,
                                  width: 8,
                                ),
                          const SizedBox(width: 8),
                          state == 1
                              ? Container(
                                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), color: PitikColors.primaryOrange),
                                  height: 8,
                                  width: 18,
                                )
                              : Container(
                                  decoration: const BoxDecoration(color: PitikColors.grey, shape: BoxShape.circle),
                                  height: 8,
                                  width: 8,
                                ),
                          const SizedBox(width: 8),
                          state == 2
                              ? Container(
                                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), color: PitikColors.primaryOrange),
                                  height: 8,
                                  width: 18,
                                )
                              : Container(
                                  decoration: const BoxDecoration(color: PitikColors.grey, shape: BoxShape.circle),
                                  height: 8,
                                  width: 8,
                                )
                        ]),
                        state == 0 || state == 1
                            ? GestureDetector(
                                onTap: () => AutoRouter.of(context).replace(const LoginRoute()),
                                child: Row(
                                  children: [Text('Lewati', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)), const SizedBox(width: 8), const Icon(Icons.arrow_forward_ios, size: 14)],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    )),
                Positioned.fill(
                    left: 16,
                    right: 16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 32),
                        state == 0
                            ? PitikAsset.icon(
                                svg: PitikSvg.boardingOne,
                                size: 160,
                              )
                            : state == 1
                                ? PitikAsset.icon(
                                    svg: PitikSvg.boardingTwo,
                                    size: 160,
                                  )
                                : PitikAsset.icon(
                                    svg: PitikSvg.boardingThree,
                                    size: 160,
                                  ),
                        const SizedBox(height: 16),
                        state == 0
                            ? Text('Pendapatan Tinggi dan Stabil', style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange))
                            : state == 1
                                ? Text('Kualitas Sapronak Baik dan Teruji', style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange))
                                : Text('Penggunaan Teknologi untuk Budidaya Ayam', style: PitikTextStyle.custom(fontSize: 16, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange)),
                        const SizedBox(height: 8),
                        state == 0
                            ? Text('Harga ayam kompetitif dengan skema insentif yang adil dan transparan untuk menjamin pendapatan peternak',
                                textAlign: TextAlign.center, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText))
                            : state == 1
                                ? Text('Kualitas sapronak unggul dari produsen ternama dan diuji dengan menggunakan teknologi Pitik',
                                    textAlign: TextAlign.center, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText))
                                : Text('Pantau kondisi kandang secara real-time menggunakan IoT serta dukungan dari algoritma Pitik untuk meningkatkan efisiensi kandang',
                                    textAlign: TextAlign.center, style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    left: 32,
                    right: 32,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: btnNext,
                    ))
              ])),
        ));
  }
}
