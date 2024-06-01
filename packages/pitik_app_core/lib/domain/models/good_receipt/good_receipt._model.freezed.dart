// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'good_receipt._model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoodReceipt _$GoodReceiptFromJson(Map<String, dynamic> json) {
  return _GoodReceipt.fromJson(json);
}

/// @nodoc
mixin _$GoodReceipt {
  String? get receivedDate => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  List<Product?>? get details => throw _privateConstructorUsedError;
  List<MediaUploadModel?>? get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoodReceiptCopyWith<GoodReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodReceiptCopyWith<$Res> {
  factory $GoodReceiptCopyWith(
          GoodReceipt value, $Res Function(GoodReceipt) then) =
      _$GoodReceiptCopyWithImpl<$Res, GoodReceipt>;
  @useResult
  $Res call(
      {String? receivedDate,
      String? remarks,
      List<Product?>? details,
      List<MediaUploadModel?>? photos});
}

/// @nodoc
class _$GoodReceiptCopyWithImpl<$Res, $Val extends GoodReceipt>
    implements $GoodReceiptCopyWith<$Res> {
  _$GoodReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedDate = freezed,
    Object? remarks = freezed,
    Object? details = freezed,
    Object? photos = freezed,
  }) {
    return _then(_value.copyWith(
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      photos: freezed == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoodReceiptImplCopyWith<$Res>
    implements $GoodReceiptCopyWith<$Res> {
  factory _$$GoodReceiptImplCopyWith(
          _$GoodReceiptImpl value, $Res Function(_$GoodReceiptImpl) then) =
      __$$GoodReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? receivedDate,
      String? remarks,
      List<Product?>? details,
      List<MediaUploadModel?>? photos});
}

/// @nodoc
class __$$GoodReceiptImplCopyWithImpl<$Res>
    extends _$GoodReceiptCopyWithImpl<$Res, _$GoodReceiptImpl>
    implements _$$GoodReceiptImplCopyWith<$Res> {
  __$$GoodReceiptImplCopyWithImpl(
      _$GoodReceiptImpl _value, $Res Function(_$GoodReceiptImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedDate = freezed,
    Object? remarks = freezed,
    Object? details = freezed,
    Object? photos = freezed,
  }) {
    return _then(_$GoodReceiptImpl(
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Product?>?,
      photos: freezed == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<MediaUploadModel?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$GoodReceiptImpl implements _GoodReceipt {
  const _$GoodReceiptImpl(
      {this.receivedDate,
      this.remarks,
      final List<Product?>? details,
      final List<MediaUploadModel?>? photos})
      : _details = details,
        _photos = photos;

  factory _$GoodReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoodReceiptImplFromJson(json);

  @override
  final String? receivedDate;
  @override
  final String? remarks;
  final List<Product?>? _details;
  @override
  List<Product?>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
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
  String toString() {
    return 'GoodReceipt(receivedDate: $receivedDate, remarks: $remarks, details: $details, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoodReceiptImpl &&
            (identical(other.receivedDate, receivedDate) ||
                other.receivedDate == receivedDate) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      receivedDate,
      remarks,
      const DeepCollectionEquality().hash(_details),
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoodReceiptImplCopyWith<_$GoodReceiptImpl> get copyWith =>
      __$$GoodReceiptImplCopyWithImpl<_$GoodReceiptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoodReceiptImplToJson(
      this,
    );
  }
}

abstract class _GoodReceipt implements GoodReceipt {
  const factory _GoodReceipt(
      {final String? receivedDate,
      final String? remarks,
      final List<Product?>? details,
      final List<MediaUploadModel?>? photos}) = _$GoodReceiptImpl;

  factory _GoodReceipt.fromJson(Map<String, dynamic> json) =
      _$GoodReceiptImpl.fromJson;

  @override
  String? get receivedDate;
  @override
  String? get remarks;
  @override
  List<Product?>? get details;
  @override
  List<MediaUploadModel?>? get photos;
  @override
  @JsonKey(ignore: true)
  _$$GoodReceiptImplCopyWith<_$GoodReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
