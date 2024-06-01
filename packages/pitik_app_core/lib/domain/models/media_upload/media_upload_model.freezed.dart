// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaUploadModel _$MediaUploadModelFromJson(Map<String, dynamic> json) {
  return _MediaUploadModel.fromJson(json);
}

/// @nodoc
mixin _$MediaUploadModel {
  String? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaUploadModelCopyWith<MediaUploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaUploadModelCopyWith<$Res> {
  factory $MediaUploadModelCopyWith(
          MediaUploadModel value, $Res Function(MediaUploadModel) then) =
      _$MediaUploadModelCopyWithImpl<$Res, MediaUploadModel>;
  @useResult
  $Res call({String? id, String? url});
}

/// @nodoc
class _$MediaUploadModelCopyWithImpl<$Res, $Val extends MediaUploadModel>
    implements $MediaUploadModelCopyWith<$Res> {
  _$MediaUploadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaUploadModelImplCopyWith<$Res>
    implements $MediaUploadModelCopyWith<$Res> {
  factory _$$MediaUploadModelImplCopyWith(_$MediaUploadModelImpl value,
          $Res Function(_$MediaUploadModelImpl) then) =
      __$$MediaUploadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? url});
}

/// @nodoc
class __$$MediaUploadModelImplCopyWithImpl<$Res>
    extends _$MediaUploadModelCopyWithImpl<$Res, _$MediaUploadModelImpl>
    implements _$$MediaUploadModelImplCopyWith<$Res> {
  __$$MediaUploadModelImplCopyWithImpl(_$MediaUploadModelImpl _value,
      $Res Function(_$MediaUploadModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
  }) {
    return _then(_$MediaUploadModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$MediaUploadModelImpl implements _MediaUploadModel {
  const _$MediaUploadModelImpl({this.id, this.url});

  factory _$MediaUploadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaUploadModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? url;

  @override
  String toString() {
    return 'MediaUploadModel(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaUploadModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaUploadModelImplCopyWith<_$MediaUploadModelImpl> get copyWith =>
      __$$MediaUploadModelImplCopyWithImpl<_$MediaUploadModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaUploadModelImplToJson(
      this,
    );
  }
}

abstract class _MediaUploadModel implements MediaUploadModel {
  const factory _MediaUploadModel({final String? id, final String? url}) =
      _$MediaUploadModelImpl;

  factory _MediaUploadModel.fromJson(Map<String, dynamic> json) =
      _$MediaUploadModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$MediaUploadModelImplCopyWith<_$MediaUploadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
