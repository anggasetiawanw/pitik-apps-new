import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumDailyReportFormState {
  initial,
  loading,
  loadingFetch,
  mfChickDeadUploaded,
  mfChickRecordUploaded,
  searchFeedDone,
  searchOVKDone,
  success,
  successFetch,
  error,
  errorFetch,
  idle
}

class DailyReportFormState extends Equatable {
  final EnumDailyReportFormState state;
  final String message;
  final Report report;
  final List<MediaUploadModel> mediaChickDead;
  final List<MediaUploadModel> mediaChickRecord;
  final List<Product> feedBrand;
  final List<Product> ovk;
  final bool isAlreadySubmit;
  final int statePage;
  final double totalCount;
  final double totalWeight;

   const DailyReportFormState({
    this.report = const Report(),
    this.state = EnumDailyReportFormState.initial,
    this.message = '',
    this.mediaChickDead = const [],
    this.mediaChickRecord = const [],
    this.feedBrand = const [],
    this.ovk = const [],
    this.isAlreadySubmit = false,
    this.statePage = 0,
    this.totalCount = 0,
    this.totalWeight = 0,
  });

  const DailyReportFormState.initial({
    this.report = const Report(),
    this.state = EnumDailyReportFormState.initial,
    this.message = '',
    this.mediaChickDead = const [],
    this.mediaChickRecord = const [],
    this.feedBrand = const [],
    this.ovk = const [],
    this.isAlreadySubmit = false,
    this.statePage = 0,
    this.totalCount = 0,
    this.totalWeight = 0,
  });

  DailyReportFormState copyWith({
    EnumDailyReportFormState? state,
    String? message,
    Report? report,
    List<MediaUploadModel>? mediaChickDead,
    List<MediaUploadModel>? mediaChickRecord,
    List<Product>? feedBrand,
    List<Product>? ovk,
    bool? isAlreadySubmit,
    int? statePage,
    double? totalCount,
    double? totalWeight,
  }) {
    return DailyReportFormState(
      state: state ?? this.state,
      message: message ?? this.message,
      report: report ?? this.report,
      mediaChickDead: mediaChickDead ?? this.mediaChickDead,
      mediaChickRecord: mediaChickRecord ?? this.mediaChickRecord,
      feedBrand: feedBrand ?? this.feedBrand,
      ovk: ovk ?? this.ovk,
      isAlreadySubmit: isAlreadySubmit ?? this.isAlreadySubmit,
      statePage: statePage ?? this.statePage,
      totalCount: totalCount ?? this.totalCount,
      totalWeight: totalWeight ?? this.totalWeight,
    );
  }

  @override
  String toString() {
    return 'DailyReportFormState(state: $state, message: $message, mediaChickDead: $mediaChickDead, mediaChickRecord: $mediaChickRecord, feedBrand: $feedBrand, ovk: $ovk, isAlreadySubmit: $isAlreadySubmit), statePage: $statePage, totalCount: $totalCount, totalWeight: $totalWeight';
  }

  @override
  List<Object?> get props => [state, message, report, mediaChickDead, mediaChickRecord, feedBrand, ovk, isAlreadySubmit, statePage, totalCount, totalWeight];
}
