import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../provider/pullet_in_provider.dart';
import '../provider/state/pullet_in_state.dart';

@RoutePage()
class PulletInScreen extends ConsumerStatefulWidget {
  final Coop coop;
  const PulletInScreen({
    required this.coop,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PulletInScreenState();
}

class _PulletInScreenState extends ConsumerState<PulletInScreen> {
  late Coop coop = widget.coop;

  late ButtonFill btnSubmit = ButtonFill(
    provider: ProviderCreator.addButtonFillProvider(),
    label: 'Simpan',
    onClick: () => addRequestChickin(),
  );
  late DateTimeField dtTanggal = DateTimeField(
    flag: DateTimeField.DATE_FLAG,
    label: 'Tanggal',
    hint: 'yyyy-MM-dd',
    alertText: '',
    onDateTimeSelected: (time, dateField) => ref.read(dateField.getProvider().notifier).setTextSelected('${Convert.getYear(time)}-${Convert.getMonthNumber(time)}-${Convert.getDay(time)}'),
    provider: ProviderCreator.addDateFieldNotifier(),
  );
  final EditField efPopulation = EditField(
    tag: 'PopulasiPulletIn',
    label: 'Populasi',
    hint: '',
    alertText: '',
    textUnit: 'Ekor',
    maxInput: 20,
    inputType: TextInputType.number,
    onTyping: (value, control) {},
    provider: ProviderCreator.addEditFieldNotifier(),
  );

  final EditField efAge = EditField(
    tag: 'UmurPulletIn',
    label: 'Umur',
    hint: '',
    alertText: '',
    textUnit: 'Minggu',
    maxInput: 20,
    inputType: TextInputType.number,
    onTyping: (value, control) {},
    provider: ProviderCreator.addEditFieldNotifier(),
  );

  final EditField efBw = EditField(
    tag: 'BWPulletIn',
    label: 'BW',
    hint: 'BW',
    alertText: 'Harus diisi..!',
    textUnit: 'gr',
    maxInput: 20,
    inputType: TextInputType.number,
    onTyping: (value, control) {},
    provider: ProviderCreator.addEditFieldNotifier(),
  );

  final EditField efUniform = EditField(
    tag: 'UniformityPulletIn',
    label: 'Uniformity',
    hint: 'Uniformity',
    alertText: 'Harus diisi..!',
    textUnit: '%',
    maxInput: 20,
    inputType: TextInputType.number,
    onTyping: (value, control) {},
    provider: ProviderCreator.addEditFieldNotifier(),
  );

  late DateTimeField dtTruckGo = DateTimeField(
    label: 'Jam Truck Berangkat',
    hint: '08:00',
    alertText: 'Harus diisi..!',
    onDateTimeSelected: (time, dateField) => ref.read(dateField.getProvider().notifier).setTextSelected(
          '${Convert.getHour(time)}:${Convert.getMinute(time)}:${Convert.getSecond(time)}',
        ),
    flag: DateTimeField.TIME_FLAG,
    provider: ProviderCreator.addDateFieldNotifier(),
  );

  late DateTimeField dtTruckCome = DateTimeField(
    label: 'Jam Truck Tiba',
    hint: '12:00',
    alertText: 'Harus diisi..!',
    onDateTimeSelected: (time, dateField) => ref.read(dateField.getProvider().notifier).setTextSelected(
          '${Convert.getHour(time)}:${Convert.getMinute(time)}:${Convert.getSecond(time)}',
        ),
    flag: DateTimeField.TIME_FLAG,
    provider: ProviderCreator.addDateFieldNotifier(),
  );

  late DateTimeField dtFinishPulletIn = DateTimeField(
    label: 'Selesai Pullet In',
    hint: '04/06/2023 - 12:00',
    alertText: 'Harus diisi..!',
    onDateTimeSelected: (time, dateField) => ref.read(dateField.getProvider().notifier).setTextSelected(
          '${Convert.getYear(time)}-${Convert.getMonthNumber(time)}-${Convert.getDay(time)} ${Convert.getHour(time)}:${Convert.getMinute(time)}',
        ),
    provider: ProviderCreator.addDateFieldNotifier(),
  );

  final EditField efDesc = EditField(
    tag: 'keteranganPulletIn',
    label: 'Keterangan',
    hint: 'Keterangan',
    alertText: '',
    textUnit: '',
    maxInput: 500,
    inputType: TextInputType.multiline,
    height: 160,
    onTyping: (value, editField) {},
    provider: ProviderCreator.addEditFieldNotifier(),
  );

  late MediaField mfSuratJalan = MediaField(
    provider: ProviderCreator.addMediaFieldNotifier(),
    label: 'Upload Surat Jalan',
    hint: '',
    alertText: 'Harus menyertakan media foto',
    showGalleryOptions: true,
    type: MediaField.PHOTO,
    onMediaResult: (file) {
      if (file != null) {
        ref.read(pulletInNotifierProvider.notifier).uploapSuratJalan(file: file);
      }
    },
  );

  late MediaField mfFormPullet = MediaField(
    label: 'Upload Form Pullet In',
    hint: '',
    alertText: 'Harus menyertakan media foto',
    showGalleryOptions: true,
    type: MediaField.PHOTO,
    onMediaResult: (file) {
      if (file != null) {
        ref.read(pulletInNotifierProvider.notifier).uploadForm(file: file);
      }
    },
    provider: ProviderCreator.addMediaFieldNotifier(),
  );
  late MediaField mfAnotherPullet = MediaField(
    label: 'Upload Dokumen Lainnya',
    hint: '',
    alertText: '',
    showGalleryOptions: true,
    type: MediaField.PHOTO,
    onMediaResult: (file) {
      if (file != null) {
        ref.read(pulletInNotifierProvider.notifier).uploadDocument(file: file);
      }
    },
    provider: ProviderCreator.addMediaFieldNotifier(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pulletInNotifierProvider.notifier).resetState();
      ref.read(pulletInNotifierProvider.notifier).getRequestChickin(farmingCycleId: coop.farmingCycleId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(pulletInNotifierProvider);
    ref.listen(
      pulletInNotifierProvider.select((value) => value),
      (PulletInState? previous, PulletInState next) {
        if (next.state == EnumPulletInState.mfSuratUploaded) {
          Navigator.of(context).pop();
          ref.read(mfSuratJalan.getProvider().notifier)
            ..setFileName(next.mediaListSurat.isNotEmpty ? next.mediaListSurat.last.url! : '-')
            ..setInformasiText('File telah terupload')
            ..showInformation();
        } else if (next.state == EnumPulletInState.mfFormUploaded) {
          Navigator.of(context).pop();
          ref.read(mfFormPullet.getProvider().notifier)
            ..setFileName(next.mediaForm.isNotEmpty ? next.mediaForm.last.url! : '-')
            ..setInformasiText('File telah terupload')
            ..showInformation();
        } else if (next.state == EnumPulletInState.mfDocumentUploaded) {
          Navigator.of(context).pop();
          ref.read(mfAnotherPullet.getProvider().notifier)
            ..setFileName(next.mediaDocument.isNotEmpty ? next.mediaDocument.last.url! : '-')
            ..setInformasiText('File telah terupload')
            ..showInformation();
        } else if (next.state == EnumPulletInState.success) {
          Navigator.of(context).pop();
          PitikDialog.showToastSuccess(context, 'Pullet In berhasil dilakukan');
          Navigator.of(context).pop();
        } else if (next.state == EnumPulletInState.successFetch) {
          Future<void>.delayed(const Duration(milliseconds: 500), () {
            setDetailForm(next.requestChickin);
          });
        } else if (next.state == EnumPulletInState.loading) {
          PitikDialog.showLoadingDialog(context);
        } else if (next.state == EnumPulletInState.error) {
          if (previous?.state == EnumPulletInState.loading) {
            Navigator.of(context).pop();
          }
          PitikDialog.showToastError(context, next.message);
        } else if (next.state == EnumPulletInState.loadingFetch) {
          PitikDialog.showLoadingPage(context);
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: PitikAppBar(
            title: 'Pullet In',
          )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2)]),
        child: btnSubmit,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  if (controller.isAlreadySubmit)
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: PitikColors.greenBackground, borderRadius: BorderRadius.all(Radius.circular(8))),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              PitikAsset.iconCustom(svg: PitikSvg.checkboxCircleGreen),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Kamu sudah selesai melakukan Pullet In',
                                  style: PitikTextStyle.custom(
                                    fontSize: 14,
                                    fontWeight: PitikTextStyle.medium,
                                    color: PitikColors.green,
                                  ).copyWith(overflow: TextOverflow.clip),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 16)
                      ],
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: PitikColors.greyBackground, border: const Border.fromBorderSide(BorderSide(width: 1.4, color: PitikColors.outlineColor))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Detail Pullet In', style: PitikTextStyle.custom(fontSize: 14, fontWeight: FontWeight.bold, color: PitikColors.black)),
                        const SizedBox(height: 16),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Tanggal Mulai Siklus', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                          Text(controller.requestChickin.startDate ?? '-', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                        ]),
                        const SizedBox(height: 8),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Tipe Pullet', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                          Text(controller.requestChickin.chickType != null ? controller.requestChickin.chickType!.chickTypeName ?? '-' : '-', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                          // Text('-', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                        ]),
                        const SizedBox(height: 4),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text('Total Populasi', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText)),
                          Text('${controller.requestChickin.initialPopulation ?? '-'} Ekor', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                          // Text('- Ekor', style: PitikTextStyle.custom(fontSize: 12, fontWeight: PitikTextStyle.medium, color: PitikColors.black))
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  dtTanggal,
                  Row(
                    children: [
                      Expanded(child: efPopulation),
                      const SizedBox(width: 8),
                      Expanded(child: efAge),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: efBw),
                      const SizedBox(width: 8),
                      Expanded(child: efUniform),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: dtTruckGo),
                      const SizedBox(width: 8),
                      Expanded(child: dtTruckCome),
                    ],
                  ),
                  dtFinishPulletIn,
                  efDesc,
                  if (!controller.isAlreadySubmit) ...[
                    mfSuratJalan,
                    mfFormPullet,
                    mfAnotherPullet,
                  ] else ...[
                    const SizedBox(height: 16),
                    Column(
                      children: List.generate(controller.requestChickin.suratJalanPhotos != null ? controller.requestChickin.suratJalanPhotos!.length : 0, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              controller.requestChickin.suratJalanPhotos![index] != null ? controller.requestChickin.suratJalanPhotos![index]!.url! : '',
                              width: MediaQuery.of(context).size.width - 36,
                              height: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: List.generate(controller.requestChickin.pulletInFormPhotos != null ? controller.requestChickin.pulletInFormPhotos!.length : 0, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              controller.requestChickin.pulletInFormPhotos![index] != null ? controller.requestChickin.pulletInFormPhotos![index]!.url! : '',
                              width: MediaQuery.of(context).size.width - 36,
                              height: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: List.generate(controller.requestChickin.photos != null ? controller.requestChickin.photos!.length : 0, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              controller.requestChickin.photos![index] != null ? controller.requestChickin.photos![index]!.url! : '',
                              width: MediaQuery.of(context).size.width - 36,
                              height: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addRequestChickin() {
    if (isValid()) {
      _showBottomDialog();
    }
  }

  bool isValid() {
    if (ref.read(dtTanggal.getProvider().select((value) => value.textSelected)).isEmpty) {
      ref.read(dtTanggal.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(dtTanggal.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(efPopulation.getProvider()).getInput().isEmpty) {
      ref.read(efPopulation.getProvider()).showAlert();
      Scrollable.ensureVisible(ref.read(efPopulation.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(efAge.getProvider()).getInput().isEmpty) {
      ref.read(efAge.getProvider()).showAlert();
      Scrollable.ensureVisible(ref.read(efAge.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(efBw.getProvider()).getInput().isEmpty) {
      ref.read(efBw.getProvider()).showAlert();
      Scrollable.ensureVisible(ref.read(efBw.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(efUniform.getProvider()).getInput().isEmpty) {
      ref.read(efUniform.getProvider()).showAlert();
      Scrollable.ensureVisible(ref.read(efUniform.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(dtTruckGo.getProvider().select((value) => value.textSelected)).isEmpty) {
      ref.read(dtTruckGo.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(dtTruckGo.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(dtTruckCome.getProvider().select((value) => value.textSelected)).isEmpty) {
      ref.read(dtTruckCome.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(dtTruckCome.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(dtFinishPulletIn.getProvider().select((value) => value.textSelected)).isEmpty) {
      ref.read(dtFinishPulletIn.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(dtFinishPulletIn.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(pulletInNotifierProvider).mediaListSurat.isEmpty) {
      ref.read(mfFormPullet.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(mfFormPullet.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(pulletInNotifierProvider).mediaListSurat.isEmpty) {
      ref.read(mfSuratJalan.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(mfSuratJalan.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    if (ref.read(pulletInNotifierProvider).mediaForm.isEmpty) {
      ref.read(mfFormPullet.getProvider().notifier).showAlert();
      Scrollable.ensureVisible(ref.read(mfFormPullet.getProvider().select((value) => value.formKey)).currentContext!);
      return false;
    }

    return true;
  }

  Future<void> _showBottomDialog() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: Container(
          color: Colors.white,
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
                  child: Text('Apakah kamu yakin data yang dimasukan sudah benar?', style: PitikTextStyle.custom(fontSize: 20, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange))),
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Tanggal Pullet In', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                      Text(ref.read(dtTanggal.getProvider().select((value) => value.textSelected)), style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ]),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Populasi', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                      Text('${ref.read(efPopulation.getProvider()).getInput()} Ekor', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ]),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Umur', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                      Text('${ref.read(efAge.getProvider()).getInput()} Minggu', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ]),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('BW', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                      Text('${ref.read(efBw.getProvider()).getInput()} gr', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ]),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Uniformity', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                      Text('${ref.read(efUniform.getProvider()).getInput()} %', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ]),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jam Truck Berangkat', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                        Text(ref.read(dtTruckGo.getProvider().select((value) => value.textSelected)), style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Jam Truck Tiba', style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText)),
                      Text(ref.read(dtTruckCome.getProvider().select((value) => value.textSelected)), style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ]),
                    const SizedBox(height: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(
                        'Selesai Pullet In',
                        style: PitikTextStyle.custom(fontSize: 12, color: PitikColors.greyText),
                      ),
                      Text(ref.read(dtFinishPulletIn.getProvider().select((value) => value.textSelected)), style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.bold))
                    ])
                  ])),
              Container(
                  margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                      child: ButtonFill(
                        label: 'Yakin',
                        onClick: () {
                          Navigator.pop(context);
                          ref.read(pulletInNotifierProvider.notifier).addPulletIn(requestChickin: generatePayload(), farmingCycleId: coop.farmingCycleId!);
                        },
                        provider: ProviderCreator.addButtonFillProvider(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ButtonOutline(
                        provider: ProviderCreator.addButtonOutlineProvider(),
                        label: 'Tidak Yakin',
                        onClick: () => Navigator.pop(context),
                      ),
                    )
                  ])),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }

  RequestChickin generatePayload() {
    return RequestChickin(
      startDate: ref.read(dtTanggal.getProvider().select((value) => value.textSelected)),
      initialPopulation: (ref.read(efPopulation.getProvider()).getInputNumber() ?? 0).toInt(),
      pulletInWeeks: (ref.read(efAge.getProvider()).getInputNumber() ?? 0).toInt(),
      additionalPopulation: 0,
      bw: (ref.read(efBw.getProvider()).getInputNumber() ?? 0).toInt(),
      uniformity: (ref.read(efUniform.getProvider()).getInputNumber() ?? 0).toInt(),
      truckLeaving: ref.read(dtTruckGo.getProvider().select((value) => value.textSelected)),
      truckArrival: ref.read(dtTruckCome.getProvider().select((value) => value.textSelected)),
      finishChickIn: ref.read(dtFinishPulletIn.getProvider().select((value) => value.textSelected)),
      remarks: ref.read(efDesc.getProvider()).getInput(),
      suratJalanPhotos: ref.read(pulletInNotifierProvider).mediaListSurat,
      pulletInFormPhotos: ref.read(pulletInNotifierProvider).mediaForm,
      photos: ref.read(pulletInNotifierProvider).mediaDocument,
    );
  }

  void setDetailForm(RequestChickin request) {
    String truckGo = '';
    String truckCome = '';
    String doneDocIn = '';
    try {
      final DateFormat formatTime = DateFormat('HH:mm');

      final DateTime newTruckGo = DateFormat('HH:mm:ss').parse(request.truckLeaving ?? '');
      truckGo = formatTime.format(newTruckGo);

      final DateTime newTruckCome = DateFormat('HH:mm:ss').parse(request.truckArrival ?? '');
      truckCome = formatTime.format(newTruckCome);

      final DateTime newDoneDocIn = DateFormat('HH:mm:ss').parse(request.finishChickIn ?? '');
      doneDocIn = DateFormat('HH:mm').format(newDoneDocIn);
    } catch (_) {}
    ref.read(dtTanggal.getProvider().notifier).disable();
    ref.read(dtTanggal.getProvider().notifier).setTextSelected(Convert.getDate(request.startDate ?? ''));
    ref.read(efAge.getProvider().notifier).setInput((request.pulletInWeeks ?? 0).toString());
    ref.read(efBw.getProvider().notifier).setInput((request.bw ?? 0).toString());
    ref.read(efPopulation.getProvider().notifier).setInput((request.initialPopulation ?? 0).toString());
    ref.read(efUniform.getProvider().notifier).setInput((request.uniformity ?? 0).toString());
    ref.read(dtTruckGo.getProvider().notifier).setTextSelected(truckGo);
    ref.read(dtTruckCome.getProvider().notifier).setTextSelected(truckCome);
    ref.read(dtFinishPulletIn.getProvider().notifier).setTextSelected(doneDocIn);
    ref.read(efDesc.getProvider().notifier).setInput(request.remarks ?? '');
    if (request.hasFinishedDOCin != null && request.hasFinishedDOCin!) {
      ref.read(efPopulation.getProvider().notifier).disable();
      ref.read(efAge.getProvider().notifier).disable();
      ref.read(efBw.getProvider().notifier).disable();
      ref.read(efUniform.getProvider().notifier).disable();
      ref.read(dtTruckGo.getProvider().notifier).disable();
      ref.read(dtTruckCome.getProvider().notifier).disable();
      ref.read(dtFinishPulletIn.getProvider().notifier).disable();
      ref.read(efDesc.getProvider().notifier).disable();
      ref.read(mfAnotherPullet.getProvider().notifier).disable();
      ref.read(mfFormPullet.getProvider().notifier).disable();
      ref.read(mfSuratJalan.getProvider().notifier).disable();
      ref.read(btnSubmit.getProvider().notifier).disable();
    }
    Navigator.of(context).pop();
  }
}
