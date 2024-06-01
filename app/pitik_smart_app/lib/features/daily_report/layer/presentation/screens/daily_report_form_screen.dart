// ignore_for_file: unused_result

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

import '../../../../../utils/debouncer.dart';
import '../providers/daily_report_provider.dart';
import '../providers/enum_daily_report.dart';
import '../providers/state/form/daily_report_form_state.dart';
import '../widgets/status_daily_report.dart';

@RoutePage()
class DailyReportFormScreen extends ConsumerStatefulWidget {
  final Coop coop;
  final Report report;
  const DailyReportFormScreen(this.coop, this.report, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DailyReportFormScreenState();
}

class _DailyReportFormScreenState extends ConsumerState<DailyReportFormScreen> {
  late Coop coop = widget.coop;
  late Report report = widget.report;

  //Need To Change to State
  bool isFeed = true;
  late List<Container> barList = <Container>[
    Container(color: PitikColors.primaryLight, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)),
    Container(color: PitikColors.primaryLight, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)),
  ];
  late List<PitikAsset> pointList = <PitikAsset>[
    PitikAsset.iconCustom(svg: PitikSvg.barPointActiveOrange),
    PitikAsset.iconCustom(svg: PitikSvg.barPointInactive),
    PitikAsset.iconCustom(svg: PitikSvg.barPointInactive),
  ];
  late List<Text> textPointLabelList = <Text>[
    Text('Produksi\nAyam', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange), textAlign: TextAlign.center),
    Text('Sapronak', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText), textAlign: TextAlign.center),
    Text('Produksi\nTelur', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText), textAlign: TextAlign.center),
  ];

  late AccordionField afOvkReason;
  late AccordionField afReason;
  late AccordionField afAbnormalEgg;
  late ButtonFill bfNextOrSubmit;
  late EditField efWeight;
  late EditField efCulled;
  late EditField efDead;
  late EditField efFeedQuantity;
  late EditField efOvkQuantity;
  late EditField efUtuhCoklat;
  late EditField efUtuhCoklatTotal;
  late EditField efUtuhKrem;
  late EditField efUtuhKremTotal;
  late EditField efRetak;
  late EditField efRetakTotal;
  late EditField efPecah;
  late EditField efPecahTotal;
  late EditField efKotor;
  late EditField efKotorTotal;
  late EditField efEggDisposal;
  late EditField efTotal;
  late EditField efBeratTotal;
  late EditField efDesc;
  late MediaField mfChickDead;
  late MediaField mfRecordingCard;
  late MultipleFormField<Product> mffFeed;
  late MultipleFormField<Product> mffOvk;
  late MultipleFormField<MortalityReason> mffReasonChickDead;
  late SuggestField sfOvk;
  late SuggestField sfFeed;
  late final Debounceable<Iterable<String>?, String> debouncedSearchFeed;
  late final Debounceable<Iterable<String>?, String> debouncedSearchOvk;
  @override
  void initState() {
    super.initState();
    debouncedSearchFeed = _debounce<Iterable<String>?, String>(getFeedBrands);
    debouncedSearchOvk = _debounce<Iterable<String>?, String>(getOvkBrands);

    bfNextOrSubmit = ButtonFill(
      provider: ProviderCreator.addButtonFillProvider(),
      label: 'Selanjutnya',
      onClick: () => buttonAction(),
    );

    efWeight = EditField(
      tag: 'efWeightDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Bobot',
      hint: 'Ketik di sini',
      alertText: 'Harus diisi..!',
      textUnit: 'gr',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efCulled = EditField(
      tag: 'efCulledDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Afkir',
      hint: 'Ketik di sini',
      alertText: 'Harus diisi..!',
      textUnit: 'Ekor',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efDead = EditField(
      tag: 'efDeadDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Kematian',
      hint: 'Ketik di sini',
      alertText: 'Harus diisi..!',
      textUnit: 'Ekor',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efFeedQuantity = EditField(
      tag: 'efFeedQuantityDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Total',
      hint: 'Ketik di sini',
      alertText: 'Total belum diisi..!',
      textUnit: '',
      maxInput: 20,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efOvkQuantity = EditField(
      tag: 'efOvkQuantityDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Total',
      hint: 'Ketik di sini',
      alertText: 'Total belum diisi..!',
      textUnit: '',
      maxInput: 20,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efTotal = EditField(
      tag: 'efTotalDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Total',
      hint: 'Auto',
      alertText: 'Harus diisi..!',
      textUnit: 'Butir',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efBeratTotal = EditField(
      tag: 'efBeratTotalDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Berat Total',
      hint: 'Auto',
      alertText: 'Harus diisi..!',
      textUnit: 'kg',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
    );
    efDesc = EditField(
      tag: 'efDescDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Keterangan',
      hint: 'Tulis keterangan',
      alertText: 'Harus diisi..!',
      textUnit: '',
      maxInput: 300,
      inputType: TextInputType.multiline,
      height: 160,
      onTyping: (text, field) {},
    );

    afOvkReason = AccordionField(
        provider: ProviderCreator.addAccordionFieldNotifier(isKeepAlive: true),
        label: 'Alasan',
        hint: 'Pilih salah satu',
        alertText: 'Harus dipilih..!',
        items: const {'Re-Vaccination': false, 'Pemberian Vitamin': false, 'Pencagahan Penyakit': false},
        onSpinnerSelected: (text) {});
    afReason = AccordionField(
        provider: ProviderCreator.addAccordionFieldNotifier(isKeepAlive: true),
        label: 'Alasan',
        hint: 'Pilih alasan',
        alertText: 'Harus dipilih..!',
        items: const {'Heat stress': false, 'Terjepit': false, 'IBD Pinguin': false, 'Kekurangan oksigen': false, 'Snot': false, 'Kanibal': false, 'Prolapsus': false, 'CRD': false, 'Lainnya': false},
        onSpinnerSelected: (text) {});
    afAbnormalEgg = AccordionField(
        provider: ProviderCreator.addAccordionFieldNotifier(isKeepAlive: true),
        label: 'Ada Telur Abnormal?',
        hint: 'Pilih salah satu',
        alertText: 'Harus dipilih..!',
        items: const {
          'Ya': false,
          'Tidak': false,
        },
        onSpinnerSelected: (text) {});

    mfChickDead = MediaField(
        provider: ProviderCreator.addMediaFieldNotifier(isKeepAlive: true),
        label: 'Upload foto kematian',
        hideLabel: true,
        hint: 'Upload foto kematian',
        alertText: 'Harus diisi..!',
        type: MediaField.PHOTO,
        onMediaResult: (file) {
          if (file != null) {
            ref.read(dailyReportFormNotifierProvider.notifier).uploadChickDead(file: file);
          }
        });

    mfRecordingCard = MediaField(
        provider: ProviderCreator.addMediaFieldNotifier(isKeepAlive: true),
        label: 'Upload Kartu Recording',
        hideLabel: true,
        hint: 'Upload Kartu Recording',
        alertText: 'Harus diisi..!',
        type: MediaField.PHOTO,
        onMediaResult: (file) {
          if (file != null) {
            ref.read(dailyReportFormNotifierProvider.notifier).uploadChickRecord(file: file);
          }
        });

    mffReasonChickDead = MultipleFormField<MortalityReason>(
        provider: ProviderCreator.addMultipleFormFieldNotifier<MortalityReason>(isKeepAlive: true),
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        labelButtonAdd: 'Tambah Catatan Kematian',
        initInstance: const {},
        childAdded: () => _createChildAdded(getReason(), getQuantityReason(data: null)),
        increaseWhenDuplicate: (deadReason) => _createChildAdded(getReason(), getQuantityReason(data: deadReason)),
        selectedObject: () => getReasonSelectedObject(),
        selectedObjectWhenIncreased: (deadReason) => getReasonSelectedObjectWhenIncreased(deadReason),
        keyData: () => getReason(),
        onAfterAdded: () {
          ref.read(afReason.getProvider().notifier).reset();
          ref.read(efDead.getProvider().notifier).setInput('');
        },
        validationAdded: () {
          bool isPass = true;
          if (ref.read(efDead.getProvider()).getInputNumber() == null) {
            ref.read(efDead.getProvider().notifier).showAlert();
            isPass = false;
          }

          return isPass;
        },
        child: Column(children: [afReason, efDead]));

    sfFeed = SuggestField(
      provider: ProviderCreator.addSuggestFieldNotifier<Product>(isKeepAlive: true),
      childPrefix: Padding(
        padding: const EdgeInsets.all(10),
        child: PitikAsset.iconCustom(svg: PitikSvg.search),
      ),
      label: 'Merek Pakan',
      hint: 'Cari merek pakan',
      alertText: 'Merek Pakan masih kosong..!',
      suggestList: const [],
      validator: (text) => getFeedBrand(text),
      onSubmitted: (text) => ref.read(efFeedQuantity.getProvider().notifier).changeTextUnit(_getLatestFeedTextUnit()),
    );

    mffFeed = MultipleFormField<Product>(
      provider: ProviderCreator.addMultipleFormFieldNotifier<Product>(isKeepAlive: true),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      labelButtonAdd: 'Tambah Pakan',
      initInstance: const Product(),
      childAdded: () => _createChildAdded(getFeedProductName(), getFeedQuantity(product: null)),
      increaseWhenDuplicate: (product) => _createChildAdded(getFeedProductName(), getFeedQuantity(product: product)),
      selectedObject: () => getFeedSelectedObject(),
      selectedObjectWhenIncreased: (product) => getFeedSelectedObjectWhenIncreased(product),
      keyData: () => getFeedProductName(),
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), border: Border.fromBorderSide(BorderSide(color: PitikColors.greyBackground, width: 3))),
      onAfterAdded: () {
        ref.read(sfFeed.getProvider().notifier).reset();
        ref.read(efFeedQuantity.getProvider().notifier).setInput('');
      },
      validationAdded: () {
        bool isPass = true;
        if (ref.read(sfFeed.getProvider()).getSelectedObject() == null) {
          ref.read(sfFeed.getProvider().notifier).showAlert();
          isPass = false;
        }
        if (ref.read(efFeedQuantity.getProvider()).getInputNumber() == null) {
          ref.read(efFeedQuantity.getProvider().notifier).showAlert();
          isPass = false;
        }

        return isPass;
      },
      child: Column(
        children: [sfFeed, efFeedQuantity],
      ),
    );

    sfOvk = SuggestField(
      provider: ProviderCreator.addSuggestFieldNotifier<Product>(isKeepAlive: true),
      childPrefix: Padding(
        padding: const EdgeInsets.all(10),
        child: PitikAsset.iconCustom(svg: PitikSvg.search),
      ),
      label: 'Jenis OVK',
      hint: 'Cari merek OVK',
      alertText: 'Jenis OVK masih kosong..!',
      suggestList: const [],
      validator: (text) => getOvkBrand(text),
      onSubmitted: (text) => ref.read(efOvkQuantity.getProvider().notifier).changeTextUnit(_getLatestFeedTextUnit()),
    );

    mffOvk = MultipleFormField<Product>(
      provider: ProviderCreator.addMultipleFormFieldNotifier<Product>(isKeepAlive: true),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      labelButtonAdd: 'Tambah OVK',
      initInstance: const Product(),
      childAdded: () => _createChildAdded(getOvkProductName(), getOvkQuantity(product: null), reason: ref.read(afOvkReason.getProvider()).getTextSeletected()),
      increaseWhenDuplicate: (product) => _createChildAdded(getOvkProductName(), getOvkQuantity(product: product), reason: ref.read(afOvkReason.getProvider()).getTextSeletected()),
      selectedObject: () => getOvkSelectedObject(),
      selectedObjectWhenIncreased: (product) => getOvkSelectedObjectWhenIncreased(product),
      keyData: () => getOvkProductName(),
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), border: Border.fromBorderSide(BorderSide(color: PitikColors.greyBackground, width: 3))),
      onAfterAdded: () {
        ref.read(sfOvk.getProvider().notifier).reset();
        ref.read(efOvkQuantity.getProvider().notifier).setInput('');
        ref.read(afOvkReason.getProvider().notifier).setTextSelected('');
      },
      validationAdded: () {
        bool isPass = true;
        if (ref.read(sfOvk.getProvider()).getSelectedObject() == null) {
          ref.read(sfOvk.getProvider().notifier).showAlert();
          isPass = false;
        }
        if (ref.read(efOvkQuantity.getProvider()).getInputNumber() == null) {
          ref.read(efOvkQuantity.getProvider().notifier).showAlert();
          isPass = false;
        }

        if (ref.read(afOvkReason.getProvider()).getTextSeletected().isEmpty) {
          ref.read(afOvkReason.getProvider().notifier).showAlert();
          isPass = false;
        }

        return isPass;
      },
      child: Column(
        children: [sfOvk, efOvkQuantity, afOvkReason],
      ),
    );

    efUtuhCoklat = EditField(
        tag: 'efUtuhCoklatDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Utuh Coklat',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'Butir',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotal());

    efUtuhCoklatTotal = EditField(
        tag: 'efUtuhCoklatTotalDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Total',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'kg',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotalWeight());

    efUtuhKrem = EditField(
        tag: 'efUtuhKremDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Utuh Krem',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'Butir',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotal());

    efUtuhKremTotal = EditField(
        tag: 'efUtuhKremTotalDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Total',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'kg',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotalWeight());

    efRetak = EditField(
        tag: 'efRetakDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Retak',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'Butir',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotal());

    efRetakTotal = EditField(
        tag: 'efRetakTotalDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Total',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'kg',
        maxInput: 100,
        action: TextInputAction.next,
        inputType: TextInputType.number,
        onTyping: (text, field) => countTotalWeight());

    efPecah = EditField(
        tag: 'efPecahDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Pecah',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'Butir',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotal());

    efPecahTotal = EditField(
        tag: 'efPecahTotalDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Total',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'kg',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotalWeight());

    efKotor = EditField(
        tag: 'efKotorDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Kotor',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'Butir',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotal());

    efKotorTotal = EditField(
        tag: 'efKotorTotalDailyReport',
        provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
        label: 'Total',
        hint: 'Ketik di sini',
        alertText: 'Harus diisi..!',
        textUnit: 'kg',
        maxInput: 100,
        inputType: TextInputType.number,
        action: TextInputAction.next,
        onTyping: (text, field) => countTotalWeight());

    efEggDisposal = EditField(
      tag: 'efEggDisposalDailyReport',
      provider: ProviderCreator.addEditFieldNotifier(isKeepAlive: true),
      label: 'Pemusnahan',
      hint: 'Ketik di sini',
      alertText: 'Harus diisi..!',
      textUnit: 'kg',
      maxInput: 100,
      inputType: TextInputType.number,
      onTyping: (text, field) {},
      action: TextInputAction.done,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dailyReportFormNotifierProvider.notifier).resetState();
      ref.read(dailyReportFormNotifierProvider.notifier).fetchDetailReport(farmingCycleId: coop.farmingCycleId!, report: report);
      ref.read(efTotal.getProvider().notifier).disable();
      ref.read(efBeratTotal.getProvider().notifier).disable();
    });
  }

  Widget chickenProduction() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ListView(
        children: [
          Container(
              decoration: BoxDecoration(
                color: PitikColors.greyBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: PitikColors.outlineColor, width: 1),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Detail Laporan Harian', style: PitikTextStyle.custom(color: PitikColors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('${report.date}', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12))
                  ]),
                  StatusDailyReport(status: report.status!)
                ])
              ])),
          efWeight,
          efCulled,
          mfChickDead,
          const SizedBox(height: 10),
          mffReasonChickDead,
        ],
      ),
    );
  }

  Widget sapronak() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ListView(
        children: [
          Container(
              decoration: BoxDecoration(
                color: PitikColors.greyBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: PitikColors.outlineColor, width: 1),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Detail Laporan Harian', style: PitikTextStyle.custom(color: PitikColors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('${report.date}', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12))
                  ]),
                  StatusDailyReport(status: report.status!)
                ])
              ])),
          Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(sfFeed.getProvider().notifier).reset(useDelayed: true);
                      setState(() {
                        isFeed = true;
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 2) - 16,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)), color: isFeed ? PitikColors.primaryLight2 : PitikColors.primaryLight),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 12, bottom: 12),
                              child: Text('Konsumsi Pakan', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: isFeed ? PitikColors.primaryOrange : PitikColors.greyLightText))),
                          Container(height: 3, color: isFeed ? PitikColors.primaryOrange : Colors.transparent)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(sfOvk.getProvider().notifier).reset(useDelayed: true);
                      setState(() {
                        isFeed = false;
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 2) - 16,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.only(topRight: Radius.circular(10)), color: !isFeed ? PitikColors.primaryLight2 : PitikColors.primaryLight),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 12, bottom: 12),
                              child: Text('Konsumsi OVK', style: PitikTextStyle.custom(fontSize: 14, fontWeight: PitikTextStyle.medium, color: !isFeed ? PitikColors.primaryOrange : PitikColors.greyLightText))),
                          Container(height: 3, color: !isFeed ? PitikColors.primaryOrange : Colors.transparent)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              isFeed ? mffFeed : mffOvk,
            ],
          )
        ],
      ),
    );
  }

  Widget eggProdcution() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ListView(
        children: [
          Container(
              decoration: BoxDecoration(
                color: PitikColors.greyBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: PitikColors.outlineColor, width: 1),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Detail Laporan Harian', style: PitikTextStyle.custom(color: PitikColors.black, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('${report.date}', style: PitikTextStyle.custom(color: PitikColors.black, fontSize: 12))
                  ]),
                  StatusDailyReport(status: report.status!)
                ])
              ])),
          Row(children: [Expanded(child: efUtuhCoklat), const SizedBox(width: 8), Expanded(child: efUtuhCoklatTotal)]),
          Row(children: [Expanded(child: efUtuhKrem), const SizedBox(width: 8), Expanded(child: efUtuhKremTotal)]),
          Row(children: [Expanded(child: efRetak), const SizedBox(width: 8), Expanded(child: efRetakTotal)]),
          Row(children: [Expanded(child: efPecah), const SizedBox(width: 8), Expanded(child: efPecahTotal)]),
          Row(children: [Expanded(child: efKotor), const SizedBox(width: 8), Expanded(child: efKotorTotal)]),
          const SizedBox(height: 16),
          const Divider(color: PitikColors.outlineColor, height: 1.4),
          efEggDisposal,
          const SizedBox(height: 16),
          const Divider(color: PitikColors.outlineColor, height: 1.4),
          afAbnormalEgg,
          efTotal,
          efBeratTotal,
          mfRecordingCard,
          efDesc
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statePage = ref.watch(dailyReportFormNotifierProvider.select((value) => value.statePage));
    ref.listen(
      dailyReportFormNotifierProvider.select((value) => value),
      (DailyReportFormState? previous, DailyReportFormState next) {
        if (next.state == EnumDailyReportFormState.loading) {
          PitikDialog.showLoadingDialog(context);
        } else if (next.state == EnumDailyReportFormState.error) {
          if (previous?.state == EnumDailyReportFormState.loading) {
            Navigator.of(context).pop();
          }
          PitikDialog.showToastError(context, next.message);
        } else if (next.state == EnumDailyReportFormState.mfChickDeadUploaded) {
          Navigator.of(context).pop();
          ref.read(mfChickDead.getProvider().notifier)
            ..setFileName(next.mediaChickDead.isNotEmpty ? next.mediaChickDead.last.url! : '-')
            ..setInformasiText('File telah terupload')
            ..showInformation();
          ref.read(dailyReportFormNotifierProvider.notifier).doneLoad();
        } else if (next.state == EnumDailyReportFormState.mfChickRecordUploaded) {
          Navigator.of(context).pop();
          ref.read(mfRecordingCard.getProvider().notifier)
            ..setFileName(next.mediaChickRecord.isNotEmpty ? next.mediaChickRecord.last.url! : '-')
            ..setInformasiText('File telah terupload')
            ..showInformation();
          ref.read(dailyReportFormNotifierProvider.notifier).doneLoad();
        } else if (next.state == EnumDailyReportFormState.success) {
          Navigator.of(context).pop();
          PitikDialog.showToastSuccess(context, 'Laporan Harian berhasil dilakukan');
          Navigator.of(context).pop();
        } else if (next.state == EnumDailyReportFormState.successFetch) {
          Future<void>.delayed(const Duration(milliseconds: 500), () async {
            if (report.status == EnumDailyReport.FILL_SOON) {
              await _fillData(report);
            } else {
              await _fillData(next.report);
            }
          });
        } else if (next.state == EnumDailyReportFormState.loadingFetch) {
          PitikDialog.showLoadingPage(context);
        }
      },
    );

    return PopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: PitikAppBar(
            title: 'Laporan Harian',
            subTitile: '${coop.coopName}',
            description: 'Laporan Harian ${Convert.getDate(report.date)}',
            hideSubtitle: false,
            onBackPressed: () {
              if (statePage == 0) {
                Navigator.of(context).pop();
              } else if (statePage == 1) {
                _toChickenProduction();
                ref.read(bfNextOrSubmit.getProvider().notifier).changeLabel('Selanjutnya');
                ref.read(dailyReportFormNotifierProvider.notifier).changeStatePage(index: statePage - 1);
              } else if (statePage == 2) {
                _toSapronak();
                ref.read(bfNextOrSubmit.getProvider().notifier).changeLabel('Selanjutnya');
                ref.read(dailyReportFormNotifierProvider.notifier).changeStatePage(index: statePage - 1);
              }
            },
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 2)]),
          child: bfNextOrSubmit,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
              child: Row(children: [
                Stack(alignment: Alignment.centerLeft, children: [barList[0], pointList[0]]),
                Stack(alignment: Alignment.centerLeft, children: [barList[1], pointList[1]]),
                pointList[2]
              ]),
            ),
            const SizedBox(height: 8),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: getLabelPoint()),
            const SizedBox(height: 16),
            Expanded(
              child: statePage == 0
                  ? chickenProduction()
                  : statePage == 1
                      ? sapronak()
                      : eggProdcution(),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _fillData(Report reportData) async {
    ref.read(dailyReportFormNotifierProvider.notifier).doneLoad();
    final report = reportData;
    ref.read(efWeight.getProvider()).setInput('${report.averageWeight ?? ''}');
    ref.read(efCulled.getProvider()).setInput('${report.culling ?? ''}');

    // fill photo mortality
    if (report.mortalityImage != null && report.mortalityImage!.isNotEmpty) {
      ref.read(dailyReportFormNotifierProvider.notifier).setMediaChicKead(media: MediaUploadModel(url: report.mortalityImage));
      if (report.mortalityImage != null && report.mortalityImage!.isNotEmpty) {
        ref.read(mfChickDead.getProvider().notifier)
          ..setFileName(report.mortalityImage!.isNotEmpty ? report.mortalityImage! : '-')
          ..setInformasiText('File telah terupload')
          ..showInformation();
      }
    }

    // fill list reason
    if (report.mortalityList != null) {
      for (var reason in report.mortalityList!) {
        ref.read(mffReasonChickDead.getProvider().notifier).addData(
              child: _createChildAdded(getReason(data: reason), getQuantityReason(data: reason)),
              object: reason,
              key: getReason(data: reason),
            );
      }
    }

    // fill list product feed

    if (report.feedConsumptions != null) {
      for (var product in report.feedConsumptions!) {
        ref.read(mffFeed.getProvider().notifier).addData(
              child: _createChildAdded(getFeedProductName(product: product), getFeedQuantity(product: product)),
              object: product,
              key: getFeedProductName(product: product),
            );
      }
    }

    // fill list product ovk
    if (report.ovkConsumptions != null) {
      for (var product in report.ovkConsumptions!) {
        ref.read(mffOvk.getProvider().notifier).addData(
              child: _createChildAdded(getOvkProductName(product: product), getOvkQuantity(product: product), reason: product != null ? product.remarks ?? '' : ''),
              object: product,
              key: getOvkProductName(product: product),
            );
      }
    }

    // fill harvested egg
    if (report.harvestedEgg != null) {
      for (var egg in report.harvestedEgg!) {
        if (egg != null) {
          if (egg.productItem!.name == 'Telur Utuh Cokelat') {
            ref.read(efUtuhCoklat.getProvider()).setInput('${egg.quantity}');
            ref.read(efUtuhCoklatTotal.getProvider()).setInput('${egg.weight}');
          } else if (egg.productItem!.name == 'Telur Utuh Krem') {
            ref.read(efUtuhKrem.getProvider()).setInput('${egg.quantity}');
            ref.read(efUtuhKremTotal.getProvider()).setInput('${egg.weight}');
          } else if (egg.productItem!.name == 'Telur Retak') {
            ref.read(efRetak.getProvider()).setInput('${egg.quantity}');
            ref.read(efRetakTotal.getProvider()).setInput('${egg.weight}');
          } else if (egg.productItem!.name == 'Telur Pecah') {
            ref.read(efPecah.getProvider()).setInput('${egg.quantity}');
            ref.read(efPecahTotal.getProvider()).setInput('${egg.weight}');
          } else if (egg.productItem!.name == 'Telur Kotor') {
            ref.read(efKotor.getProvider()).setInput('${egg.quantity}');
            ref.read(efKotorTotal.getProvider()).setInput('${egg.weight}');
          }
        }
      }
    }

    // fill photo recording card
    if (report.recordingImage != null && report.recordingImage!.isNotEmpty) {
      ref.read(dailyReportFormNotifierProvider.notifier).setMediaChickRecord(media: MediaUploadModel(url: report.recordingImage));
      if (report.recordingImage != null && report.recordingImage!.isNotEmpty) {
        ref.read(mfRecordingCard.getProvider().notifier)
          ..setFileName(report.recordingImage!.isNotEmpty ? report.recordingImage! : '-')
          ..setInformasiText('File telah terupload')
          ..showInformation();
      }
    }
    ref.read(efEggDisposal.getProvider()).setInput('${report.eggDisposal ?? ''}');
    ref.read(afAbnormalEgg.getProvider()).setTextSelected(report.isAbnormal != null && report.isAbnormal! ? 'Ya' : 'Tidak');
    ref.read(efDesc.getProvider()).setInput(report.remarks ?? '');
    countTotal();
    countTotalWeight();
    PitikDialog.closeDialog(context);
  }

  void buttonAction() {
    final int statePage = ref.read(dailyReportFormNotifierProvider).statePage;
    if (statePage == 0) {
      bool isPass = true;
      if (ref.read(efCulled.getProvider()).getInputNumber() == null) {
        ref.read(efCulled.getProvider().notifier).showAlert();
        isPass = false;
      }
      if (ref.read(mffReasonChickDead.getProvider()).getListObjectAdded().isEmpty) {
        PitikDialog.showToastError(context, 'Alasan kematian masih kosong, silahkan isi minimal satu..!');
        isPass = false;
      }
      if (isPass) {
        _toSapronak();
        ref.read(bfNextOrSubmit.getProvider().notifier).changeLabel('Selanjutnya');
        ref.read(dailyReportFormNotifierProvider.notifier).changeStatePage(index: 1);
      }
    } else if (statePage == 1) {
      bool isPass = true;
      if (ref.read(mffFeed.getProvider()).getListObjectAdded().isEmpty) {
        PitikDialog.showToastError(context, 'Konsumsi Pakan masih kosong, silahkan isi minimal satu..!');
        isPass = false;
      }
      if (isPass) {
        _toEggProduction();
        ref.read(bfNextOrSubmit.getProvider().notifier).changeLabel('Submit');
        ref.read(dailyReportFormNotifierProvider.notifier).changeStatePage(index: 2);
      }
    } else if (statePage == 2) {
      bool isPass = true;

      if (ref.read(efUtuhCoklat.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efUtuhCoklat.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efUtuhCoklat.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efUtuhCoklatTotal.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efUtuhCoklatTotal.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efUtuhCoklatTotal.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efUtuhKrem.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efUtuhKrem.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efUtuhKrem.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efUtuhKremTotal.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efUtuhKremTotal.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efUtuhKremTotal.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efRetak.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efRetak.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efRetak.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efRetakTotal.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efRetakTotal.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efRetakTotal.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efPecah.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efPecah.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efPecah.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efPecahTotal.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efPecahTotal.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efPecahTotal.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efKotor.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efKotor.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efKotor.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(efKotorTotal.getProvider()).getInputNumber() == null) {
        Scrollable.ensureVisible(ref.read(efKotorTotal.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(efKotorTotal.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(afAbnormalEgg.getProvider()).getTextSeletected().isEmpty) {
        Scrollable.ensureVisible(ref.read(afAbnormalEgg.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(afAbnormalEgg.getProvider().notifier).showAlert();
        isPass = false;
      }

      if (ref.read(dailyReportFormNotifierProvider).mediaChickRecord.isEmpty) {
        Scrollable.ensureVisible(ref.read(mfRecordingCard.getProvider().select((value) => value.formKey)).currentContext!);
        ref.read(mfRecordingCard.getProvider().notifier).showAlert();

        isPass = false;
      }

      if (isPass) {
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
                                ref.read(dailyReportFormNotifierProvider.notifier).addReport(farmingCycleId: coop.farmingCycleId!, payload: generatePayload(), date: report.date!);
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
    }
  }

  Report generatePayload() {
    _changeHarvestedEggData(productName: 'Telur Utuh Cokelat', producItemId: 'cc9f03bd-5d75-467f-bada-74382ac7bac2', editField: efUtuhCoklat);
    _changeHarvestedEggData(productName: 'Telur Utuh Cokelat', producItemId: 'cc9f03bd-5d75-467f-bada-74382ac7bac2', editField: efUtuhCoklatTotal, isQuantity: false);
    _changeHarvestedEggData(productName: 'Telur Utuh Krem', producItemId: 'd66aa790-4495-483f-96ce-00214c220a49', editField: efUtuhKrem);
    _changeHarvestedEggData(productName: 'Telur Utuh Krem', producItemId: 'd66aa790-4495-483f-96ce-00214c220a49', editField: efUtuhKremTotal, isQuantity: false);
    _changeHarvestedEggData(productName: 'Telur Retak', producItemId: '96ed27f9-f2a4-4c33-919d-e7ac8d274154', editField: efRetak);
    _changeHarvestedEggData(productName: 'Telur Retak', producItemId: '96ed27f9-f2a4-4c33-919d-e7ac8d274154', editField: efRetakTotal, isQuantity: false);
    _changeHarvestedEggData(productName: 'Telur Pecah', producItemId: '6721a808-ceea-44a9-bbed-eba8b0ccfcb4', editField: efPecah);
    _changeHarvestedEggData(productName: 'Telur Pecah', producItemId: '6721a808-ceea-44a9-bbed-eba8b0ccfcb4', editField: efPecahTotal, isQuantity: false);
    _changeHarvestedEggData(productName: 'Telur Kotor', producItemId: '2186e5cf-feb6-4f9c-ad6e-e43f6957262b', editField: efKotor);
    _changeHarvestedEggData(productName: 'Telur Kotor', producItemId: '2186e5cf-feb6-4f9c-ad6e-e43f6957262b', editField: efKotorTotal, isQuantity: false);
    int mortality = 0;
    ref.read(mffReasonChickDead.getProvider()).listObjectAdded.entries.map((entry) {
      if ((entry.value as MortalityReason).quantity != null) {
        mortality += (entry.value as MortalityReason).quantity!.toInt();
      }
    }).toList();
    String? mortalityImage;
    final listMortalityIamge = ref.read(dailyReportFormNotifierProvider).mediaChickDead;
    if (listMortalityIamge.isNotEmpty) {
      mortalityImage = listMortalityIamge[0].url;
    }

    String? recordingIamge;
    final listRecordingIamge = ref.read(dailyReportFormNotifierProvider).mediaChickRecord;
    if (listRecordingIamge.isNotEmpty) {
      recordingIamge = listRecordingIamge[0].url;
    }
    final List<Product> listFeedProduct = ref
        .read(mffFeed.getProvider())
        .listObjectAdded
        .entries
        .map((entry) {
          Product entryProduct = entry.value as Product; // Accessing the value property
          if (entryProduct.feedStockSummaryId == null) {
            entryProduct = entryProduct.copyWith(feedStockSummaryId: entryProduct.id);
          }
          return entryProduct;
        })
        .toList()
        .cast<Product>();

    final List<Product> listOvkProduct = ref
        .read(mffOvk.getProvider())
        .getListObjectAdded()
        .entries
        .map((entry) {
          Product entryProduct = entry.value as Product; // Accessing the value property
          if (entryProduct.ovkStockSummaryId == null) {
            entryProduct = entryProduct.copyWith(ovkStockSummaryId: entryProduct.id);
          }
          return entryProduct;
        })
        .toList()
        .cast<Product>();
    return Report(
        averageWeight: ref.read(efWeight.getProvider()).getInputNumber(),
        culling: ref.read(efCulled.getProvider()).getInputNumber()?.toInt(),
        mortality: mortality,
        mortalityImage: mortalityImage,
        mortalityList: ref.read(mffReasonChickDead.getProvider()).listObjectAdded.entries.map((entry) => entry.value as MortalityReason).toList(),
        feedConsumptions: listFeedProduct,
        ovkConsumptions: listOvkProduct,
        harvestedEgg: report.harvestedEgg,
        recordingImage: recordingIamge,
        remarks: ref.read(efDesc.getProvider()).getInput(),
        eggDisposal: ref.read(efEggDisposal.getProvider()).getInputNumber(),
        isAbnormal: ref.read(afAbnormalEgg.getProvider()).getTextSeletected() == 'Ya',
        feedTypeCode: '',
        feedQuantity: 0);
  }

  void _changeHarvestedEggData({required String productName, required EditField editField, required String producItemId, bool isQuantity = true}) {
    bool isContain = false;
    final int length = report.harvestedEgg?.length ?? 0;
    final List<Product> updatedHarvestedEgg = List.from(report.harvestedEgg ?? []);

    for (int i = 0; i < length; i++) {
      if (report.harvestedEgg?[i]?.productItem?.name == productName) {
        final Product? currentProduct = report.harvestedEgg?[i];
        Product? updatedProduct;

        if (isQuantity) {
          updatedProduct = currentProduct?.copyWith(quantity: ref.read(editField.getProvider()).getInputNumber(), productItemId: producItemId);
        } else {
          updatedProduct = currentProduct?.copyWith(weight: ref.read(editField.getProvider()).getInputNumber(), productItemId: producItemId);
        }
        updatedHarvestedEgg[i] = updatedProduct!;
        isContain = true;
        break;
      }
    }

    if (!isContain) {
      final data = Product(
        productItemId: producItemId,
        productItem: Product(name: productName, uom: 'Butir'),
        quantity: isQuantity ? ref.read(editField.getProvider()).getInputNumber() : null,
        weight: isQuantity ? null : ref.read(editField.getProvider()).getInputNumber(),
      );
      updatedHarvestedEgg.add(data);
    }

    report = report.copyWith(
      harvestedEgg: updatedHarvestedEgg,
    );
  }

  Column _createChildAdded(String title, String quantity, {String reason = ''}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(child: Text(title, style: TextStyle(color: PitikColors.black, fontSize: 12, fontWeight: PitikTextStyle.medium))),
        const SizedBox(width: 16),
        Text(quantity, style: TextStyle(color: PitikColors.greyText, fontSize: 12, fontWeight: PitikTextStyle.medium))
      ]),
      reason.isNotEmpty ? Text('Alasan: $reason', style: TextStyle(color: PitikColors.greyText, fontSize: 12, fontWeight: PitikTextStyle.medium)) : const SizedBox()
    ]);
  }

  void _toChickenProduction() {
    // PitikColors.track('Open_page_chicken_production');
    // state = 0;
    // isSubmitButton = false;

    barList.insert(0, Container(color: PitikColors.primaryLight, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)));
    barList.insert(1, Container(color: PitikColors.primaryLight, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)));

    // pointList.insert(0, SvgPicture.asset('images/bar_point_active_orange.svg'));
    // pointList.insert(1, SvgPicture.asset('images/bar_point_inactive.svg'));
    // pointList.insert(2, SvgPicture.asset('images/bar_point_inactive.svg'));

    pointList.insert(0, PitikAsset.iconCustom(svg: PitikSvg.barPointActiveOrange));
    pointList.insert(1, PitikAsset.iconCustom(svg: PitikSvg.barPointInactive));
    pointList.insert(2, PitikAsset.iconCustom(svg: PitikSvg.barPointInactive));

    textPointLabelList.insert(0, Text('Produksi\nAyam', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange), textAlign: TextAlign.center));
    textPointLabelList.insert(1, Text('Sapronak', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText), textAlign: TextAlign.center));
    textPointLabelList.insert(2, Text('Produksi\nTelur', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText), textAlign: TextAlign.center));
  }

  void _toSapronak() {
    // PitikColors.track('Open_page_sapronak');
    // state = 1;
    // isSubmitButton = false;

    barList.insert(0, Container(color: PitikColors.primaryOrange, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)));
    barList.insert(1, Container(color: PitikColors.primaryLight, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)));

    pointList.insert(0, PitikAsset.iconCustom(svg: PitikSvg.barPointActiveGreen));
    pointList.insert(1, PitikAsset.iconCustom(svg: PitikSvg.barPointActiveOrange));
    pointList.insert(2, PitikAsset.iconCustom(svg: PitikSvg.barPointInactive));

    textPointLabelList.insert(0, Text('Produksi\nAyam', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange), textAlign: TextAlign.center));
    textPointLabelList.insert(1, Text('Sapronak', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange), textAlign: TextAlign.center));
    textPointLabelList.insert(2, Text('Produksi\nTelur', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.medium, color: PitikColors.greyText), textAlign: TextAlign.center));
  }

  void _toEggProduction() {
    // state = 2;
    // isSubmitButton = true;

    barList.insert(0, Container(color: PitikColors.greenBackground, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)));
    barList.insert(1, Container(color: PitikColors.primaryOrange, height: 8, width: _getBarWidth(), padding: const EdgeInsets.only(top: 8)));

    pointList.insert(0, PitikAsset.iconCustom(svg: PitikSvg.barPointActiveGreen));
    pointList.insert(1, PitikAsset.iconCustom(svg: PitikSvg.barPointActiveGreen));
    pointList.insert(2, PitikAsset.iconCustom(svg: PitikSvg.barPointActiveOrange));

    textPointLabelList.insert(2, Text('Produksi\nTelur', style: PitikTextStyle.custom(fontSize: 11, fontWeight: PitikTextStyle.bold, color: PitikColors.primaryOrange), textAlign: TextAlign.center));
  }

  Row getLabelPoint() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [Center(child: textPointLabelList[0]), Center(child: textPointLabelList[1]), Center(child: textPointLabelList[2])]);
  Debounceable<S, T> _debounce<S, T>(Debounceable<S?, T> function) {
    DebounceTimer? debounceTimer;

    return (T parameter) async {
      if (debounceTimer != null && !debounceTimer!.isCompleted) {
        debounceTimer!.cancel();
      }
      debounceTimer = DebounceTimer();
      try {
        await debounceTimer!.future;
      } catch (error) {
        if (error is CancelException) {
          return null;
        }
        rethrow;
      }
      return function(parameter);
    };
  }

  Future<Iterable<String>?> getFeedBrands(String query) async {
    final String keyword = query;
    if (keyword.length > 1) {
      await ref.read(dailyReportFormNotifierProvider.notifier).searchFeedBrand(keyword: keyword);
      if (ref.read(dailyReportFormNotifierProvider).state == EnumDailyReportFormState.searchFeedDone) {
        _setupSuggestBrand(field: sfFeed, productList: ref.read(dailyReportFormNotifierProvider).feedBrand, isFeed: true);
        return ref.read(sfFeed.getProvider()).suggestList;
      }
    }
    return [];
  }

  Future<Iterable<String>> getFeedBrand(String query) async {
    final Iterable<String>? options = await debouncedSearchFeed(query);
    if (options == null) {
      return [];
    }
    return options;
  }

  Future<Iterable<String>?> getOvkBrands(String query) async {
    final String keyword = query;
    if (keyword.length > 1) {
      await ref.read(dailyReportFormNotifierProvider.notifier).searchOVK(keyword: keyword);
      if (ref.read(dailyReportFormNotifierProvider).state == EnumDailyReportFormState.searchOVKDone) {
        _setupSuggestBrand(field: sfOvk, productList: ref.read(dailyReportFormNotifierProvider).ovk, isFeed: false);
        return ref.read(sfOvk.getProvider()).suggestList;
      }
    }
    return [];
  }

  Future<Iterable<String>> getOvkBrand(String query) async {
    final Iterable<String>? options = await debouncedSearchOvk(query);
    if (options == null) {
      return [];
    }
    return options;
  }

  void _setupSuggestBrand({required SuggestField field, required List<Product?> productList, bool isFeed = true}) {
    ref.read(field.getProvider().notifier).setupObjects(productList);
    final List<String> data = [];
    for (var product in productList) {
      data.add(isFeed
          ? '${product == null || product.subcategoryName == null ? '' : product.subcategoryName} - ${product == null || product.productName == null ? '' : product.productName}'
          : '${product == null || product.productName == null ? '' : product.productName}');
    }
    ref.read(field.getProvider().notifier).generateItems(data);
  }

  String getQuantityReason({MortalityReason? data}) {
    if (data != null) {
      return data.quantity == null ? '- Ekor' : '${data.quantity!.toStringAsFixed(0)} Ekor';
    } else {
      return ref.read(efDead.getProvider()).getInputNumber() == null ? '- Ekor' : '${ref.read(efDead.getProvider()).getInputNumber()!.toStringAsFixed(0)} Ekor';
    }
  }

  MortalityReason getReasonSelectedObject() {
    if (ref.read(efDead.getProvider()).getInputNumber() != null) {
      final MortalityReason deadReason = MortalityReason(cause: ref.read(afReason.getProvider()).getTextSeletected(), quantity: ref.read(efDead.getProvider()).getInputNumber()?.toInt());

      return deadReason;
    } else {
      return const MortalityReason();
    }
  }

  MortalityReason getReasonSelectedObjectWhenIncreased(MortalityReason oldReason) {
    if (ref.read(efDead.getProvider()).getInputNumber() != null) {
      final MortalityReason deadReason = MortalityReason(cause: ref.read(afReason.getProvider()).getTextSeletected(), quantity: (oldReason.quantity ?? 0) + (ref.read(efDead.getProvider()).getInputNumber() ?? 0).toInt());

      return deadReason;
    } else {
      return const MortalityReason();
    }
  }

  String getReason({MortalityReason? data}) {
    if (data != null) {
      return data.cause ?? '-';
    } else {
      if (ref.read(afReason.getProvider()).getSelectedIndex == -1) {
        return '';
      } else {
        return ref.read(afReason.getProvider()).getTextSeletected();
      }
    }
  }

  String _getLatestFeedTextUnit() {
    final Product? product = ref.read(sfFeed.getProvider()).getSelectedObject();
    if (product == null) {
      return '';
    } else {
      if (product.uom != null) {
        return product.uom!;
      } else if (product.purchaseUom != null) {
        return product.purchaseUom!;
      } else {
        return '';
      }
    }
  }

  Product getFeedSelectedObject() {
    if (ref.read(sfFeed.getProvider()).getSelectedObject() != null) {
      try {
        final Product currentProduct = ref.read(sfFeed.getProvider()).getSelectedObject();
        final Product product = currentProduct.copyWith(quantity: ref.read(efFeedQuantity.getProvider()).getInputNumber());
        return product;
      } catch (e) {
        return const Product();
      }
    } else {
      return const Product();
    }
  }

  Product getOvkSelectedObject() {
    if (ref.read(sfOvk.getProvider()).getSelectedObject() != null) {
      final Product currentProduct = ref.read(sfOvk.getProvider()).getSelectedObject();
      final Product product = currentProduct.copyWith(
        quantity: ref.read(efOvkQuantity.getProvider()).getInputNumber() ?? 0,
        remarks: ref.read(afOvkReason.getProvider()).getTextSeletected(),
        subcategoryCode: 'OVK',
        subcategoryName: 'OVK',
      );
      return product;
    } else {
      return const Product();
    }
  }

  Product getFeedSelectedObjectWhenIncreased(Product oldProduct) {
    if (ref.read(sfFeed.getProvider()).getSelectedObject() != null) {
      final Product product = ref.read(sfFeed.getProvider()).getSelectedObject();
      product.copyWith(
        quantity: (oldProduct.quantity ?? 0) + (ref.read(efFeedQuantity.getProvider()).getInputNumber() ?? 0),
        remarks: ref.read(afReason.getProvider()).getTextSeletected(),
      );

      return product;
    } else {
      return const Product();
    }
  }

  Product getOvkSelectedObjectWhenIncreased(Product oldProduct) {
    if (ref.read(sfOvk.getProvider()).getSelectedObject() != null) {
      final Product product = ref.read(sfOvk.getProvider()).getSelectedObject();
      product.copyWith(
        quantity: (oldProduct.quantity ?? 0) + (ref.read(efOvkQuantity.getProvider()).getInputNumber() ?? 0),
        remarks: ref.read(afOvkReason.getProvider()).getTextSeletected(),
        subcategoryCode: 'OVK',
        subcategoryName: 'OVK',
      );

      return product;
    } else {
      return const Product();
    }
  }

  String getFeedProductName({Product? product}) {
    if (product != null) {
      return '${product.subcategoryName ?? ''} - ${product.productName ?? ''}';
    } else {
      final Product sfFeedProduct = ref.read(sfFeed.getProvider()).getSelectedObject();
      return '${sfFeedProduct.subcategoryName ?? ''} - ${sfFeedProduct.productName ?? ''}';
    }
  }

  String getOvkProductName({Product? product}) {
    if (product != null) {
      return product.productName ?? '';
    } else {
      final Product sfOvkProduct = ref.read(sfOvk.getProvider()).getSelectedObject();
      return sfOvkProduct.productName ?? '';
    }
  }

  String getFeedQuantity({Product? product}) {
    if (product != null) {
      return '${product.quantity == null ? '' : product.quantity!.toStringAsFixed(0)} ${product.uom ?? product.purchaseUom ?? ''}';
    } else {
      final double? feedQuantity = ref.read(efFeedQuantity.getProvider()).getInputNumber();
      return '${feedQuantity == null ? '' : feedQuantity.toStringAsFixed(0)} ${ref.read(efFeedQuantity.getProvider()).getTextUnit()}';
    }
  }

  String getOvkQuantity({Product? product}) {
    if (product != null) {
      return '${product.quantity == null ? '' : product.quantity!.toStringAsFixed(0)} ${product.uom ?? product.purchaseUom ?? ''}';
    } else {
      final double? ovkQuantity = ref.read(efOvkQuantity.getProvider()).getInputNumber();
      return '${ovkQuantity == null ? '' : ovkQuantity.toStringAsFixed(0)} ${ref.read(efOvkQuantity.getProvider()).getTextUnit()}';
    }
  }

  void countTotal() {
    final double? utuhCoklat = ref.read(efUtuhCoklat.getProvider()).getInputNumber();
    final double? utuhKrem = ref.read(efUtuhKrem.getProvider()).getInputNumber();
    final double? retak = ref.read(efRetak.getProvider()).getInputNumber();
    final double? pecah = ref.read(efPecah.getProvider()).getInputNumber();
    final double? kotor = ref.read(efKotor.getProvider()).getInputNumber();

    double total = 0;
    total += utuhCoklat ?? 0;
    total += utuhKrem ?? 0;
    total += retak ?? 0;
    total += pecah ?? 0;
    total += kotor ?? 0;

    ref.read(efTotal.getProvider().notifier).setInput(total.toStringAsFixed(0));
  }

  void countTotalWeight() {
    final double? utuhCoklatTotal = ref.read(efUtuhCoklatTotal.getProvider()).getInputNumber();
    final double? utuhKremTotal = ref.read(efUtuhKremTotal.getProvider()).getInputNumber();
    final double? retakTotal = ref.read(efRetakTotal.getProvider()).getInputNumber();
    final double? pecahTotal = ref.read(efPecahTotal.getProvider()).getInputNumber();
    final double? kotorTotal = ref.read(efKotorTotal.getProvider()).getInputNumber();

    double totalWeight = 0;
    totalWeight += utuhCoklatTotal ?? 0;
    totalWeight += utuhKremTotal ?? 0;
    totalWeight += retakTotal ?? 0;
    totalWeight += pecahTotal ?? 0;
    totalWeight += kotorTotal ?? 0;

    ref.read(efBeratTotal.getProvider().notifier).setInput(totalWeight.toStringAsFixed(1));
  }

  double _getBarWidth() => (MediaQuery.of(context).size.width - 80) / 2;
}
