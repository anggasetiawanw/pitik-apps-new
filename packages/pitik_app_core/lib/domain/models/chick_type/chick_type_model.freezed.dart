// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chick_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChickType _$ChickTypeFromJson(Map<String, dynamic> json) {
  return _ChickType.fromJson(json);
}

/// @nodoc
mixin _$ChickType {
  String? get id => throw _privateConstructorUsedError;
  String? get chickTypeName => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChickTypeCopyWith<ChickType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChickTypeCopyWith<$Res> {
  factory $ChickTypeCopyWith(ChickType value, $Res Function(ChickType) then) =
      _$ChickTypeCopyWithImpl<$Res, ChickType>;
  @useResult
  $Res call({String? id, String? chickTypeName, String? category});
}

/// @nodoc
class _$ChickTypeCopyWithImpl<$Res, $Val extends ChickType>
    implements $ChickTypeCopyWith<$Res> {
  _$ChickTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chickTypeName = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chickTypeName: freezed == chickTypeName
          ? _value.chickTypeName
          : chickTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChickTypeImplCopyWith<$Res>
    implements $ChickTypeCopyWith<$Res> {
  factory _$$ChickTypeImplCopyWith(
          _$ChickTypeImpl value, $Res Function(_$ChickTypeImpl) then) =
      __$$ChickTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? chickTypeName, String? category});
}

/// @nodoc
class __$$ChickTypeImplCopyWithImpl<$Res>
    extends _$ChickTypeCopyWithImpl<$Res, _$ChickTypeImpl>
    implements _$$ChickTypeImplCopyWith<$Res> {
  __$$ChickTypeImplCopyWithImpl(
      _$ChickTypeImpl _value, $Res Function(_$ChickTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chickTypeName = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ChickTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chickTypeName: freezed == chickTypeName
          ? _value.chickTypeName
          : chickTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ChickTypeImpl implements _ChickType {
  const _$ChickTypeImpl({this.id, this.chickTypeName, this.category});

  factory _$ChickTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChickTypeImplFromJson(json);

  @override
  final String? id;
  @override
  final String? chickTypeName;
  @override
  final String? category;

  @override
  String toString() {
    return 'ChickType(id: $id, chickTypeName: $chickTypeName, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChickTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chickTypeName, chickTypeName) ||
                other.chickTypeName == chickTypeName) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chickTypeName, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChickTypeImplCopyWith<_$ChickTypeImpl> get copyWith =>
      __$$ChickTypeImplCopyWithImpl<_$ChickTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChickTypeImplToJson(
      this,
    );
  }
}

abstract class _ChickType implements ChickType {
  const factory _ChickType(
      {final String? id,
      final String? chickTypeName,
      final String? category}) = _$ChickTypeImpl;

  factory _ChickType.fromJson(Map<String, dynamic> json) =
      _$ChickTypeImpl.fromJson;

  @override
  String? get id;
  @override
  String? get chickTypeName;
  @override
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$ChickTypeImplCopyWith<_$ChickTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
