import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../providers/daily_report_provider.dart';
import '../providers/state/revision/daily_report_revision_state.dart';

@RoutePage()
class DailyReportRevisionScreen extends ConsumerStatefulWidget {
  final Coop coop;
  final Report report;
  const DailyReportRevisionScreen({required this.coop, required this.report, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DailyReportRevisionScreenState();
}

class _DailyReportRevisionScreenState extends ConsumerState<DailyReportRevisionScreen> {
  late Coop coop = widget.coop;
  late Report report = widget.report;
  late ButtonFill btRevisi;
  late EditField efOtherReasonRevision;
  @override
  void initState() {
    super.initState();
    btRevisi = ButtonFill(
      provider: ProviderCreator.addButtonFillProvider(),
      label: 'Permintaan Edit',
      onClick: () {
        if (ref.read(dailyReportRevisionNotifierProvider).stateReasonRevision == 2 && ref.read(efOtherReasonRevision.getProvider()).getInput().isEmpty) {
          ref.read(efOtherReasonRevision.getProvider().notifier).showAlert();
        } else if (ref.read(dailyReportRevisionNotifierProvider).revisionReasonList.isEmpty) {
          PitikDialog.showToastError(context, 'Revisi apa yang anda lakukan..?');
        } else {
          _pushRevisionToServer();
        }
      },
    );
    efOtherReasonRevision = EditField(provider: ProviderCreator.addEditFieldNotifier(), label: 'Other', hint: 'Masukkan alasan lainnya', alertText: 'Harus diisi..!', textUnit: '', maxInput: 200, onTyping: (value, ef) {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dailyReportRevisionNotifierProvider.notifier).resetState();
      ref.read(btRevisi.getProvider().notifier).disable();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateReasonRevision = ref.watch(dailyReportRevisionNotifierProvider.select((value) => value.stateReasonRevision));

    ref.listen(
      dailyReportRevisionNotifierProvider.select((value) => value),
      (DailyReportRevisionState? previous, DailyReportRevisionState next) {
        if (next.state == EnumDailyReportRevisionState.loading) {
          PitikDialog.showLoadingDialog(context);
        } else if (next.state == EnumDailyReportRevisionState.error) {
          if (previous?.state == EnumDailyReportRevisionState.loading) {
            Navigator.of(context).pop();
          }
          PitikDialog.showToastError(context, next.message);
        } else if (next.state == EnumDailyReportRevisionState.success) {
          Navigator.of(context).pop();
          PitikDialog.showToastSuccess(context, 'Laporan Harian berhasil dilakukan');
          Navigator.of(context).pop();
        } else if (next.state == EnumDailyReportRevisionState.loaded) {
          if (previous?.state == EnumDailyReportRevisionState.loading) {
            Navigator.of(context).pop();
          }
        }
      },
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: PitikAppBar(
          title: 'Laporan Harian',
          subTitile: '${coop.coopName}',
          description: 'Laporan Harian ${Convert.getDate(report.date)}',
          hideSubtitle: false,
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2)]),
        child: btRevisi,
      ),
      body: RawScrollbar(
        thumbColor: PitikColors.primaryOrange,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Container(
                  decoration: BoxDecoration(color: PitikColors.blueBackground, borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(16),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    PitikAsset.iconCustom(svg: PitikSvg.informationBlue),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Text('Pada Form Revisi, anda harus memastikan bahwa semua data yang diisi adalah benar dan revisi data sudah final dimana tidak ada rekayasa apapun yang dilakukan dalam Kandang',
                            style: TextStyle(color: PitikColors.blue, fontSize: 14, fontWeight: PitikTextStyle.medium)))
                  ])),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: PitikColors.outlineColor, width: 1)),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kenapa anda harus melakukan Revisi?', style: TextStyle(color: PitikColors.black, fontSize: 14, fontWeight: PitikTextStyle.bold)),
                    const SizedBox(height: 8),
                    GestureDetector(
                        onTap: () => ref.read(dailyReportRevisionNotifierProvider.notifier).changeStateRevision(0),
                        child: Row(children: [
                          stateReasonRevision == 0 ? PitikAsset.iconCustom(svg: PitikSvg.onSpin) : PitikAsset.iconCustom(svg: PitikSvg.offSpin),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Perubahan data recording karena adjustment', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)))
                        ])),
                    const SizedBox(height: 16),
                    GestureDetector(
                        onTap: () => ref.read(dailyReportRevisionNotifierProvider.notifier).changeStateRevision(1),
                        child: Row(children: [
                          stateReasonRevision == 1 ? PitikAsset.iconCustom(svg: PitikSvg.onSpin) : PitikAsset.iconCustom(svg: PitikSvg.offSpin),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Recording tidak jelas karena terkena air coretan', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)))
                        ])),
                    const SizedBox(height: 16),
                    GestureDetector(
                        onTap: () => ref.read(dailyReportRevisionNotifierProvider.notifier).changeStateRevision(2),
                        child: Row(children: [
                          stateReasonRevision == 2 ? PitikAsset.iconCustom(svg: PitikSvg.onSpin) : PitikAsset.iconCustom(svg: PitikSvg.offSpin),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Other', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)))
                        ])),
                    if (stateReasonRevision == 2) ...[const SizedBox(height: 16), efOtherReasonRevision]
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: PitikColors.outlineColor, width: 1)),
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Revisi apa yang anda lakukan?', style: TextStyle(color: PitikColors.black, fontSize: 14, fontWeight: PitikTextStyle.bold)),
                    const SizedBox(height: 16),
                    CheckBoxField(
                        provider: ProviderCreator.addCheckBoxNotifier(), title: 'Ubah Konsumsi Pakan', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Ubah Konsumsi Pakan', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(provider: ProviderCreator.addCheckBoxNotifier(), title: 'Re-Vaccination', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Re-Vaccination', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(provider: ProviderCreator.addCheckBoxNotifier(), title: 'Pemberian OVK', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Pemberian OVK', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(
                        provider: ProviderCreator.addCheckBoxNotifier(), title: 'Pencegahan Penyakit', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Pencegahan Penyakit', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(provider: ProviderCreator.addCheckBoxNotifier(), title: 'Ubah ABW', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Ubah ABW', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(provider: ProviderCreator.addCheckBoxNotifier(), title: 'Ubah Kematian', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Ubah Kematian', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(provider: ProviderCreator.addCheckBoxNotifier(), title: 'Ubah Afkir', onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Ubah Afkir', isAdd: value)),
                    const SizedBox(height: 16),
                    CheckBoxField(
                        provider: ProviderCreator.addCheckBoxNotifier(),
                        title: 'Ubah jumlah panen telur',
                        onTap: (value) => ref.read(dailyReportRevisionNotifierProvider.notifier).updateRevisionReasonList(reason: 'Ubah jumlah panen telur', isAdd: value))
                  ])),
              const SizedBox(height: 16),
              CheckBoxField(
                  provider: ProviderCreator.addCheckBoxNotifier(),
                  title: 'Dengan ini saya menyatakan bahwa benar ada revisi pada kandang ini',
                  onTap: (value) {
                    if (value) {
                      ref.read(btRevisi.getProvider().notifier).enable();
                    } else {
                      ref.read(btRevisi.getProvider().notifier).disable();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _pushRevisionToServer() {
    showModalBottomSheet(
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
                            ref.read(dailyReportRevisionNotifierProvider.notifier).requestDailyReportRevision(farmingCycleId: coop.farmingCycleId!, date: report.date!, reason: _getReasonRevision());
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

  String _getReasonRevision() {
    final stateReasonRevision = ref.read(dailyReportRevisionNotifierProvider).stateReasonRevision;
    if (stateReasonRevision == 0) {
      return 'Perubahan data recording karena adjustment';
    } else if (stateReasonRevision == 1) {
      return 'Recording tidak jelas karena terkena air coretan';
    } else {
      return ref.read(efOtherReasonRevision.getProvider()).getInput();
    }
  }
}
