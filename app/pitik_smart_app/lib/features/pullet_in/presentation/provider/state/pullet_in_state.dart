import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumPulletInState {
  initial,
  loading,
  loadingFetch,
  mfSuratUploaded,
  mfFormUploaded,
  mfDocumentUploaded,
  success,
  successFetch,
  error,
}

class PulletInState extends Equatable {
  final EnumPulletInState state;
  final String message;
  final RequestChickin requestChickin;
  final List<MediaUploadModel> mediaForm;
  final List<MediaUploadModel> mediaListSurat;
  final List<MediaUploadModel> mediaDocument;
  final bool isAlreadySubmit;
  const PulletInState({
    this.requestChickin = const RequestChickin(),
    this.state = EnumPulletInState.initial,
    this.message = '',
    this.mediaForm = const [],
    this.mediaListSurat = const [],
    this.mediaDocument = const [],
    this.isAlreadySubmit = false,
  });

  const PulletInState.initial({
    this.requestChickin = const RequestChickin(),
    this.state = EnumPulletInState.initial,
    this.message = '',
    this.mediaForm = const [],
    this.mediaListSurat = const [],
    this.mediaDocument = const [],
    this.isAlreadySubmit = false,
  });

  PulletInState copyWith({
    EnumPulletInState? state,
    String? message,
    RequestChickin? requestChickin,
    List<MediaUploadModel>? mediaForm,
    List<MediaUploadModel>? mediaListSurat,
    List<MediaUploadModel>? mediaDocument,
    bool? isAlreadySubmit,
  }) {
    return PulletInState(
      state: state ?? this.state,
      message: message ?? this.message,
      requestChickin: requestChickin ?? this.requestChickin,
      mediaForm: mediaForm ?? this.mediaForm,
      mediaListSurat: mediaListSurat ?? this.mediaListSurat,
      mediaDocument: mediaDocument ?? this.mediaDocument,
      isAlreadySubmit: isAlreadySubmit ?? this.isAlreadySubmit,
    );
  }

  @override
  String toString() {
    return 'PulletInState(state: $state, message: $message, requestChickin: $requestChickin, mediaForm: $mediaForm, mediaListSurat: $mediaListSurat, mediaDocument: $mediaDocument, isAlreadySubmit: $isAlreadySubmit)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [state, message, requestChickin, mediaForm, mediaListSurat, mediaDocument, isAlreadySubmit];
}
