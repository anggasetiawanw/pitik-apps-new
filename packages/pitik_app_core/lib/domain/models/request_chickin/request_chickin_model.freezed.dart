// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_chickin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestChickin _$RequestChickinFromJson(Map<String, dynamic> json) {
  return _RequestChickin.fromJson(json);
}

/// @nodoc
mixin _$RequestChickin {
  String? get id => throw _privateConstructorUsedError;
  String? get poCode => throw _privateConstructorUsedError;
  String? get erpCode => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get chickInDate => throw _privateConstructorUsedError;
  int? get initialPopulation => throw _privateConstructorUsedError;
  int? get bw => throw _privateConstructorUsedError;
  int? get uniformity => throw _privateConstructorUsedError;
  int? get additionalPopulation => throw _privateConstructorUsedError;
  String? get truckArrival => throw _privateConstructorUsedError;
  String? get truckLeaving => throw _privateConstructorUsedError;
  String? get finishChickIn => throw _privateConstructorUsedError;
  String? get recordStart => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  String? get coopId => throw _privateConstructorUsedError;
  bool? get hasFinishedDOCin => throw _privateConstructorUsedError;
  int? get pulletInWeeks => throw _privateConstructorUsedError;
  Product? get doc => throw _privateConstructorUsedError;
  List<Product?>? get pakan => throw _privateConstructorUsedError;
  List<Product?>? get ovk => throw _privateConstructorUsedError;
  Procurement? get internalOvkTransferRequest =>
      throw _privateConstructorUsedError;
  ChickType? get chickType => throw _privateConstructorUsedError;
  List<MediaUploadModel?>? get suratJalanPhotos =>
      throw _privateConstructorUsedError;
  List<MediaUploadModel?>? get docInFormPhotos =>
      throw _privateConstructorUsedError;
  List<MediaUploadModel?>? get pulletInFormPhotos =>
      throw _privateConstructorUsedError;
  List<MediaUploadModel?>? get photos => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool? get mergedLogistic => throw _privateConstructorUsedError;
  String? get mergedCoopId => throw _privateConstructorUsedError;
  String? get mergedLogisticCoopName => throw _privateConstructorUsedError;
  int? get mergedLogisticFarmingCycleDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestChickinCopyWith<RequestChickin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestChickinCopyWith<$Res> {
  factory $RequestChickinCopyWith(
          RequestChickin value, $Res Function(RequestChickin) then) =
      _$RequestChickinCopyWithImpl<$Res, RequestChickin>;
  @useResult
  $Res call(
      {String? id,
      String? poCode,
      String? erpCode,
      String? startDate,
      String? chickInDate,
      int? initialPopulation,
      int? bw,
      int? uniformity,
      int? additionalPopulation,
      String? truckArrival,
      String? truckLeaving,
      String? finishChickIn,
      String? recordStart,
      String? remarks,
      String? coopId,
      bool? hasFinishedDOCin,
      int? pulletInWeeks,
      Product? doc,
      List<Product?>? pakan,
      List<Product?>? ovk,
      Procurement? internalOvkTransferRequest,
      ChickType? chickType,
      List<MediaUploadModel?>? suratJalanPhotos,
      List<MediaUploadModel?>? docInFormPhotos,
      List<MediaUploadModel?>? pulletInFormPhotos,
      List<MediaUploadModel?>? photos,
      String? notes,
      bool? mergedLogistic,
      String? mergedCoopId,
      String? mergedLogisticCoopName,
      int? mergedLogisticFarmingCycleDays});

  $ProductCopyWith<$Res>? get doc;
  $ProcurementCopyWith<$Res>? get internalOvkTransferRequest;
  $ChickTypeCopyWith<$Res>? get chickType;
}

/// @nodoc
class _$RequestChickinCopyWithImpl<$Res, $Val extends RequestChickin>
    implements $RequestChickinCopyWith<$Res> {
  _$RequestChickinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? poCode = freezed,
    Object? erpCode = freezed,
    Object? startDate = freezed,
    Object? chickInDate = freezed,
    Object? initialPopulation = freezed,
    Object? bw = freezed,
    Object? uniformity = freezed,
    Object? additionalPopulation = freezed,
    Object? truckArrival = freezed,
    Object? truckLeaving = freezed,
    Object? finishChickIn = freezed,
    Object? recordStart = freezed,
    Object? remarks = freezed,
    Object? coopId = freezed,
    Object? hasFinishedDOCin = freezed,
    Object? pulletInWeeks = freezed,
    Object? doc = freezed,
    Object? pakan = freezed,
    Object? ovk = freezed,
    Object? internalOvkTransferRequest = freezed,
    Object? chickType = freezed,
    Object? suratJalanPhotos = freezed,
    Object? docInFormPhotos = freezed,
    Object? pulletInFormPhotos = freezed,
    Object? photos = freezed,
    Object? notes = freezed,
    Object? mergedLogistic = freezed,
    Object? mergedCoopId = freezed,
    Object? mergedLogisticCoopName = freezed,
    Object? mergedLogisticFarmingCycleDays = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      poCode: freezed == poCode
          ? _value.poCode
          : poCode // ignore: cast_nullable_to_non_nullable
              as String?,
      erpCode: freezed == erpCode
          ? _value.erpCode
          : erpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chickInDate: freezed == chickInDate
          ? _value.chickInDate
          : chickInDate // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPopulation: freezed == initialPopulation
          ? _value.initialPopulation
          : initialPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
      bw: freezed == bw
          ? _value.bw
          : bw // ignore: cast_nullable_to_non_nullable
              as int?,
      uniformity: freezed == uniformity
          ? _value.uniformity
          : uniformity // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalPopulation: freezed == additionalPopulation
          ? _value.additionalPopulation
          : additionalPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
      truckArrival: freezed == truckArrival
          ? _value.truckArrival
          : truckArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      truckLeaving: freezed == truckLeaving
          ? _value.truckLeaving
          : truckLeaving // ignore: cast_nullable_to_non_nullable
              as String?,
      finishChickIn: freezed == finishChickIn
          ? _value.finishChickIn
          : finishChickIn // ignore: cast_nullable_to_non_nullable
              as String?,
      recordStart: freezed == recordStart
          ? _value.recordStart
          : recordStart // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      coopId: freezed == coopId
          ? _value.coopId
          : coopId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFinishedDOCin: freezed == hasFinishedDOCin
          ? _value.hasFinishedDOCin
          : hasFinishedDOCin // ignore: cast_nullable_to_non_nullable
              as bool?,
      pulletInWeeks: freezed == pulletInWeeks
          ? _value.pulletInWeeks
          : pulletInWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as Product?,
      pakan: freezed == pakan
          ? _value.pakan
          : pakan // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      ovk: freezed == ovk
          ? _value.ovk
          : ovk // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      internalOvkTransferRequest: freezed == internalOvkTransferRequest
          ? _value.internalOvkTransferRequest
          : internalOvkTransferRequest // ignore: cast_nullable_to_non_nullable
              as Procurement?,
      chickType: freezed == chickType
          ? _value.chickType
          : chickType // ignore: cast_nullable_to_non_nullable
              as ChickType?,
      suratJalanPhotos: freezed == suratJalanPhotos
          ? _value.suratJalanPhotos
          : suratJalanPhotos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      docInFormPhotos: freezed == docInFormPhotos
          ? _value.docInFormPhotos
          : docInFormPhotos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      pulletInFormPhotos: freezed == pulletInFormPhotos
          ? _value.pulletInFormPhotos
          : pulletInFormPhotos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      mergedLogistic: freezed == mergedLogistic
          ? _value.mergedLogistic
          : mergedLogistic // ignore: cast_nullable_to_non_nullable
              as bool?,
      mergedCoopId: freezed == mergedCoopId
          ? _value.mergedCoopId
          : mergedCoopId // ignore: cast_nullable_to_non_nullable
              as String?,
      mergedLogisticCoopName: freezed == mergedLogisticCoopName
          ? _value.mergedLogisticCoopName
          : mergedLogisticCoopName // ignore: cast_nullable_to_non_nullable
              as String?,
      mergedLogisticFarmingCycleDays: freezed == mergedLogisticFarmingCycleDays
          ? _value.mergedLogisticFarmingCycleDays
          : mergedLogisticFarmingCycleDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get doc {
    if (_value.doc == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.doc!, (value) {
      return _then(_value.copyWith(doc: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcurementCopyWith<$Res>? get internalOvkTransferRequest {
    if (_value.internalOvkTransferRequest == null) {
      return null;
    }

    return $ProcurementCopyWith<$Res>(_value.internalOvkTransferRequest!,
        (value) {
      return _then(_value.copyWith(internalOvkTransferRequest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChickTypeCopyWith<$Res>? get chickType {
    if (_value.chickType == null) {
      return null;
    }

    return $ChickTypeCopyWith<$Res>(_value.chickType!, (value) {
      return _then(_value.copyWith(chickType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestChickinImplCopyWith<$Res>
    implements $RequestChickinCopyWith<$Res> {
  factory _$$RequestChickinImplCopyWith(_$RequestChickinImpl value,
          $Res Function(_$RequestChickinImpl) then) =
      __$$RequestChickinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? poCode,
      String? erpCode,
      String? startDate,
      String? chickInDate,
      int? initialPopulation,
      int? bw,
      int? uniformity,
      int? additionalPopulation,
      String? truckArrival,
      String? truckLeaving,
      String? finishChickIn,
      String? recordStart,
      String? remarks,
      String? coopId,
      bool? hasFinishedDOCin,
      int? pulletInWeeks,
      Product? doc,
      List<Product?>? pakan,
      List<Product?>? ovk,
      Procurement? internalOvkTransferRequest,
      ChickType? chickType,
      List<MediaUploadModel?>? suratJalanPhotos,
      List<MediaUploadModel?>? docInFormPhotos,
      List<MediaUploadModel?>? pulletInFormPhotos,
      List<MediaUploadModel?>? photos,
      String? notes,
      bool? mergedLogistic,
      String? mergedCoopId,
      String? mergedLogisticCoopName,
      int? mergedLogisticFarmingCycleDays});

  @override
  $ProductCopyWith<$Res>? get doc;
  @override
  $ProcurementCopyWith<$Res>? get internalOvkTransferRequest;
  @override
  $ChickTypeCopyWith<$Res>? get chickType;
}

/// @nodoc
class __$$RequestChickinImplCopyWithImpl<$Res>
    extends _$RequestChickinCopyWithImpl<$Res, _$RequestChickinImpl>
    implements _$$RequestChickinImplCopyWith<$Res> {
  __$$RequestChickinImplCopyWithImpl(
      _$RequestChickinImpl _value, $Res Function(_$RequestChickinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? poCode = freezed,
    Object? erpCode = freezed,
    Object? startDate = freezed,
    Object? chickInDate = freezed,
    Object? initialPopulation = freezed,
    Object? bw = freezed,
    Object? uniformity = freezed,
    Object? additionalPopulation = freezed,
    Object? truckArrival = freezed,
    Object? truckLeaving = freezed,
    Object? finishChickIn = freezed,
    Object? recordStart = freezed,
    Object? remarks = freezed,
    Object? coopId = freezed,
    Object? hasFinishedDOCin = freezed,
    Object? pulletInWeeks = freezed,
    Object? doc = freezed,
    Object? pakan = freezed,
    Object? ovk = freezed,
    Object? internalOvkTransferRequest = freezed,
    Object? chickType = freezed,
    Object? suratJalanPhotos = freezed,
    Object? docInFormPhotos = freezed,
    Object? pulletInFormPhotos = freezed,
    Object? photos = freezed,
    Object? notes = freezed,
    Object? mergedLogistic = freezed,
    Object? mergedCoopId = freezed,
    Object? mergedLogisticCoopName = freezed,
    Object? mergedLogisticFarmingCycleDays = freezed,
  }) {
    return _then(_$RequestChickinImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      poCode: freezed == poCode
          ? _value.poCode
          : poCode // ignore: cast_nullable_to_non_nullable
              as String?,
      erpCode: freezed == erpCode
          ? _value.erpCode
          : erpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chickInDate: freezed == chickInDate
          ? _value.chickInDate
          : chickInDate // ignore: cast_nullable_to_non_nullable
              as String?,
      initialPopulation: freezed == initialPopulation
          ? _value.initialPopulation
          : initialPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
      bw: freezed == bw
          ? _value.bw
          : bw // ignore: cast_nullable_to_non_nullable
              as int?,
      uniformity: freezed == uniformity
          ? _value.uniformity
          : uniformity // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalPopulation: freezed == additionalPopulation
          ? _value.additionalPopulation
          : additionalPopulation // ignore: cast_nullable_to_non_nullable
              as int?,
      truckArrival: freezed == truckArrival
          ? _value.truckArrival
          : truckArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      truckLeaving: freezed == truckLeaving
          ? _value.truckLeaving
          : truckLeaving // ignore: cast_nullable_to_non_nullable
              as String?,
      finishChickIn: freezed == finishChickIn
          ? _value.finishChickIn
          : finishChickIn // ignore: cast_nullable_to_non_nullable
              as String?,
      recordStart: freezed == recordStart
          ? _value.recordStart
          : recordStart // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      coopId: freezed == coopId
          ? _value.coopId
          : coopId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasFinishedDOCin: freezed == hasFinishedDOCin
          ? _value.hasFinishedDOCin
          : hasFinishedDOCin // ignore: cast_nullable_to_non_nullable
              as bool?,
      pulletInWeeks: freezed == pulletInWeeks
          ? _value.pulletInWeeks
          : pulletInWeeks // ignore: cast_nullable_to_non_nullable
              as int?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as Product?,
      pakan: freezed == pakan
          ? _value._pakan
          : pakan // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      ovk: freezed == ovk
          ? _value._ovk
          : ovk // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      internalOvkTransferRequest: freezed == internalOvkTransferRequest
          ? _value.internalOvkTransferRequest
          : internalOvkTransferRequest // ignore: cast_nullable_to_non_nullable
              as Procurement?,
      chickType: freezed == chickType
          ? _value.chickType
          : chickType // ignore: cast_nullable_to_non_nullable
              as ChickType?,
      suratJalanPhotos: freezed == suratJalanPhotos
          ? _value._suratJalanPhotos
          : suratJalanPhotos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      docInFormPhotos: freezed == docInFormPhotos
          ? _value._docInFormPhotos
          : docInFormPhotos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      pulletInFormPhotos: freezed == pulletInFormPhotos
          ? _value._pulletInFormPhotos
          : pulletInFormPhotos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      mergedLogistic: freezed == mergedLogistic
          ? _value.mergedLogistic
          : mergedLogistic // ignore: cast_nullable_to_non_nullable
              as bool?,
      mergedCoopId: freezed == mergedCoopId
          ? _value.mergedCoopId
          : mergedCoopId // ignore: cast_nullable_to_non_nullable
              as String?,
      mergedLogisticCoopName: freezed == mergedLogisticCoopName
          ? _value.mergedLogisticCoopName
          : mergedLogisticCoopName // ignore: cast_nullable_to_non_nullable
              as String?,
      mergedLogisticFarmingCycleDays: freezed == mergedLogisticFarmingCycleDays
          ? _value.mergedLogisticFarmingCycleDays
          : mergedLogisticFarmingCycleDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RequestChickinImpl implements _RequestChickin {
  const _$RequestChickinImpl(
      {this.id,
      this.poCode,
      this.erpCode,
      this.startDate,
      this.chickInDate,
      this.initialPopulation,
      this.bw,
      this.uniformity,
      this.additionalPopulation,
      this.truckArrival,
      this.truckLeaving,
      this.finishChickIn,
      this.recordStart,
      this.remarks,
      this.coopId,
      this.hasFinishedDOCin,
      this.pulletInWeeks,
      this.doc,
      final List<Product?>? pakan,
      final List<Product?>? ovk,
      this.internalOvkTransferRequest,
      this.chickType,
      final List<MediaUploadModel?>? suratJalanPhotos,
      final List<MediaUploadModel?>? docInFormPhotos,
      final List<MediaUploadModel?>? pulletInFormPhotos,
      final List<MediaUploadModel?>? photos,
      this.notes,
      this.mergedLogistic,
      this.mergedCoopId,
      this.mergedLogisticCoopName,
      this.mergedLogisticFarmingCycleDays})
      : _pakan = pakan,
        _ovk = ovk,
        _suratJalanPhotos = suratJalanPhotos,
        _docInFormPhotos = docInFormPhotos,
        _pulletInFormPhotos = pulletInFormPhotos,
        _photos = photos;

  factory _$RequestChickinImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestChickinImplFromJson(json);

  @override
  final String? id;
  @override
  final String? poCode;
  @override
  final String? erpCode;
  @override
  final String? startDate;
  @override
  final String? chickInDate;
  @override
  final int? initialPopulation;
  @override
  final int? bw;
  @override
  final int? uniformity;
  @override
  final int? additionalPopulation;
  @override
  final String? truckArrival;
  @override
  final String? truckLeaving;
  @override
  final String? finishChickIn;
  @override
  final String? recordStart;
  @override
  final String? remarks;
  @override
  final String? coopId;
  @override
  final bool? hasFinishedDOCin;
  @override
  final int? pulletInWeeks;
  @override
  final Product? doc;
  final List<Product?>? _pakan;
  @override
  List<Product?>? get pakan {
    final value = _pakan;
    if (value == null) return null;
    if (_pakan is EqualUnmodifiableListView) return _pakan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product?>? _ovk;
  @override
  List<Product?>? get ovk {
    final value = _ovk;
    if (value == null) return null;
    if (_ovk is EqualUnmodifiableListView) return _ovk;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Procurement? internalOvkTransferRequest;
  @override
  final ChickType? chickType;
  final List<MediaUploadModel?>? _suratJalanPhotos;
  @override
  List<MediaUploadModel?>? get suratJalanPhotos {
    final value = _suratJalanPhotos;
    if (value == null) return null;
    if (_suratJalanPhotos is EqualUnmodifiableListView)
      return _suratJalanPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaUploadModel?>? _docInFormPhotos;
  @override
  List<MediaUploadModel?>? get docInFormPhotos {
    final value = _docInFormPhotos;
    if (value == null) return null;
    if (_docInFormPhotos is EqualUnmodifiableListView) return _docInFormPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaUploadModel?>? _pulletInFormPhotos;
  @override
  List<MediaUploadModel?>? get pulletInFormPhotos {
    final value = _pulletInFormPhotos;
    if (value == null) return null;
    if (_pulletInFormPhotos is EqualUnmodifiableListView)
      return _pulletInFormPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaUploadModel?>? _photos;
  @override
  List<MediaUploadModel?>? get photos {
    final value = _photos;
    if (value == null) return null;
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? notes;
  @override
  final bool? mergedLogistic;
  @override
  final String? mergedCoopId;
  @override
  final String? mergedLogisticCoopName;
  @override
  final int? mergedLogisticFarmingCycleDays;

  @override
  String toString() {
    return 'RequestChickin(id: $id, poCode: $poCode, erpCode: $erpCode, startDate: $startDate, chickInDate: $chickInDate, initialPopulation: $initialPopulation, bw: $bw, uniformity: $uniformity, additionalPopulation: $additionalPopulation, truckArrival: $truckArrival, truckLeaving: $truckLeaving, finishChickIn: $finishChickIn, recordStart: $recordStart, remarks: $remarks, coopId: $coopId, hasFinishedDOCin: $hasFinishedDOCin, pulletInWeeks: $pulletInWeeks, doc: $doc, pakan: $pakan, ovk: $ovk, internalOvkTransferRequest: $internalOvkTransferRequest, chickType: $chickType, suratJalanPhotos: $suratJalanPhotos, docInFormPhotos: $docInFormPhotos, pulletInFormPhotos: $pulletInFormPhotos, photos: $photos, notes: $notes, mergedLogistic: $mergedLogistic, mergedCoopId: $mergedCoopId, mergedLogisticCoopName: $mergedLogisticCoopName, mergedLogisticFarmingCycleDays: $mergedLogisticFarmingCycleDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestChickinImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poCode, poCode) || other.poCode == poCode) &&
            (identical(other.erpCode, erpCode) || other.erpCode == erpCode) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.chickInDate, chickInDate) ||
                other.chickInDate == chickInDate) &&
            (identical(other.initialPopulation, initialPopulation) ||
                other.initialPopulation == initialPopulation) &&
            (identical(other.bw, bw) || other.bw == bw) &&
            (identical(other.uniformity, uniformity) ||
                other.uniformity == uniformity) &&
            (identical(other.additionalPopulation, additionalPopulation) ||
                other.additionalPopulation == additionalPopulation) &&
            (identical(other.truckArrival, truckArrival) ||
                other.truckArrival == truckArrival) &&
            (identical(other.truckLeaving, truckLeaving) ||
                other.truckLeaving == truckLeaving) &&
            (identical(other.finishChickIn, finishChickIn) ||
                other.finishChickIn == finishChickIn) &&
            (identical(other.recordStart, recordStart) ||
                other.recordStart == recordStart) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.coopId, coopId) || other.coopId == coopId) &&
            (identical(other.hasFinishedDOCin, hasFinishedDOCin) ||
                other.hasFinishedDOCin == hasFinishedDOCin) &&
            (identical(other.pulletInWeeks, pulletInWeeks) ||
                other.pulletInWeeks == pulletInWeeks) &&
            (identical(other.doc, doc) || other.doc == doc) &&
            const DeepCollectionEquality().equals(other._pakan, _pakan) &&
            const DeepCollectionEquality().equals(other._ovk, _ovk) &&
            (identical(other.internalOvkTransferRequest,
                    internalOvkTransferRequest) ||
                other.internalOvkTransferRequest ==
                    internalOvkTransferRequest) &&
            (identical(other.chickType, chickType) ||
                other.chickType == chickType) &&
            const DeepCollectionEquality()
                .equals(other._suratJalanPhotos, _suratJalanPhotos) &&
            const DeepCollectionEquality()
                .equals(other._docInFormPhotos, _docInFormPhotos) &&
            const DeepCollectionEquality()
                .equals(other._pulletInFormPhotos, _pulletInFormPhotos) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.mergedLogistic, mergedLogistic) ||
                other.mergedLogistic == mergedLogistic) &&
            (identical(other.mergedCoopId, mergedCoopId) ||
                other.mergedCoopId == mergedCoopId) &&
            (identical(other.mergedLogisticCoopName, mergedLogisticCoopName) ||
                other.mergedLogisticCoopName == mergedLogisticCoopName) &&
            (identical(other.mergedLogisticFarmingCycleDays,
                    mergedLogisticFarmingCycleDays) ||
                other.mergedLogisticFarmingCycleDays ==
                    mergedLogisticFarmingCycleDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        poCode,
        erpCode,
        startDate,
        chickInDate,
        initialPopulation,
        bw,
        uniformity,
        additionalPopulation,
        truckArrival,
        truckLeaving,
        finishChickIn,
        recordStart,
        remarks,
        coopId,
        hasFinishedDOCin,
        pulletInWeeks,
        doc,
        const DeepCollectionEquality().hash(_pakan),
        const DeepCollectionEquality().hash(_ovk),
        internalOvkTransferRequest,
        chickType,
        const DeepCollectionEquality().hash(_suratJalanPhotos),
        const DeepCollectionEquality().hash(_docInFormPhotos),
        const DeepCollectionEquality().hash(_pulletInFormPhotos),
        const DeepCollectionEquality().hash(_photos),
        notes,
        mergedLogistic,
        mergedCoopId,
        mergedLogisticCoopName,
        mergedLogisticFarmingCycleDays
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestChickinImplCopyWith<_$RequestChickinImpl> get copyWith =>
      __$$RequestChickinImplCopyWithImpl<_$RequestChickinImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestChickinImplToJson(
      this,
    );
  }
}

abstract class _RequestChickin implements RequestChickin {
  const factory _RequestChickin(
      {final String? id,
      final String? poCode,
      final String? erpCode,
      final String? startDate,
      final String? chickInDate,
      final int? initialPopulation,
      final int? bw,
      final int? uniformity,
      final int? additionalPopulation,
      final String? truckArrival,
      final String? truckLeaving,
      final String? finishChickIn,
      final String? recordStart,
      final String? remarks,
      final String? coopId,
      final bool? hasFinishedDOCin,
      final int? pulletInWeeks,
      final Product? doc,
      final List<Product?>? pakan,
      final List<Product?>? ovk,
      final Procurement? internalOvkTransferRequest,
      final ChickType? chickType,
      final List<MediaUploadModel?>? suratJalanPhotos,
      final List<MediaUploadModel?>? docInFormPhotos,
      final List<MediaUploadModel?>? pulletInFormPhotos,
      final List<MediaUploadModel?>? photos,
      final String? notes,
      final bool? mergedLogistic,
      final String? mergedCoopId,
      final String? mergedLogisticCoopName,
      final int? mergedLogisticFarmingCycleDays}) = _$RequestChickinImpl;

  factory _RequestChickin.fromJson(Map<String, dynamic> json) =
      _$RequestChickinImpl.fromJson;

  @override
  String? get id;
  @override
  String? get poCode;
  @override
  String? get erpCode;
  @override
  String? get startDate;
  @override
  String? get chickInDate;
  @override
  int? get initialPopulation;
  @override
  int? get bw;
  @override
  int? get uniformity;
  @override
  int? get additionalPopulation;
  @override
  String? get truckArrival;
  @override
  String? get truckLeaving;
  @override
  String? get finishChickIn;
  @override
  String? get recordStart;
  @override
  String? get remarks;
  @override
  String? get coopId;
  @override
  bool? get hasFinishedDOCin;
  @override
  int? get pulletInWeeks;
  @override
  Product? get doc;
  @override
  List<Product?>? get pakan;
  @override
  List<Product?>? get ovk;
  @override
  Procurement? get internalOvkTransferRequest;
  @override
  ChickType? get chickType;
  @override
  List<MediaUploadModel?>? get suratJalanPhotos;
  @override
  List<MediaUploadModel?>? get docInFormPhotos;
  @override
  List<MediaUploadModel?>? get pulletInFormPhotos;
  @override
  List<MediaUploadModel?>? get photos;
  @override
  String? get notes;
  @override
  bool? get mergedLogistic;
  @override
  String? get mergedCoopId;
  @override
  String? get mergedLogisticCoopName;
  @override
  int? get mergedLogisticFarmingCycleDays;
  @override
  @JsonKey(ignore: true)
  _$$RequestChickinImplCopyWith<_$RequestChickinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
