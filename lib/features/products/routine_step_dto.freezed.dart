// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_step_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoutineStepDto _$RoutineStepDtoFromJson(Map<String, dynamic> json) {
  return _RoutineStepDto.fromJson(json);
}

/// @nodoc
mixin _$RoutineStepDto {
  int get id => throw _privateConstructorUsedError;
  String get timeOfDay =>
      throw _privateConstructorUsedError; // morning | evening
  String get stepType =>
      throw _privateConstructorUsedError; // cleanser | serum | cream | sunscreen | shampoo...
  int get productId => throw _privateConstructorUsedError;

  /// Serializes this RoutineStepDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoutineStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoutineStepDtoCopyWith<RoutineStepDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineStepDtoCopyWith<$Res> {
  factory $RoutineStepDtoCopyWith(
          RoutineStepDto value, $Res Function(RoutineStepDto) then) =
      _$RoutineStepDtoCopyWithImpl<$Res, RoutineStepDto>;
  @useResult
  $Res call({int id, String timeOfDay, String stepType, int productId});
}

/// @nodoc
class _$RoutineStepDtoCopyWithImpl<$Res, $Val extends RoutineStepDto>
    implements $RoutineStepDtoCopyWith<$Res> {
  _$RoutineStepDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoutineStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeOfDay = null,
    Object? stepType = null,
    Object? productId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      timeOfDay: null == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as String,
      stepType: null == stepType
          ? _value.stepType
          : stepType // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutineStepDtoImplCopyWith<$Res>
    implements $RoutineStepDtoCopyWith<$Res> {
  factory _$$RoutineStepDtoImplCopyWith(_$RoutineStepDtoImpl value,
          $Res Function(_$RoutineStepDtoImpl) then) =
      __$$RoutineStepDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String timeOfDay, String stepType, int productId});
}

/// @nodoc
class __$$RoutineStepDtoImplCopyWithImpl<$Res>
    extends _$RoutineStepDtoCopyWithImpl<$Res, _$RoutineStepDtoImpl>
    implements _$$RoutineStepDtoImplCopyWith<$Res> {
  __$$RoutineStepDtoImplCopyWithImpl(
      _$RoutineStepDtoImpl _value, $Res Function(_$RoutineStepDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoutineStepDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeOfDay = null,
    Object? stepType = null,
    Object? productId = null,
  }) {
    return _then(_$RoutineStepDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      timeOfDay: null == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as String,
      stepType: null == stepType
          ? _value.stepType
          : stepType // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutineStepDtoImpl implements _RoutineStepDto {
  const _$RoutineStepDtoImpl(
      {required this.id,
      required this.timeOfDay,
      required this.stepType,
      required this.productId});

  factory _$RoutineStepDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutineStepDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String timeOfDay;
// morning | evening
  @override
  final String stepType;
// cleanser | serum | cream | sunscreen | shampoo...
  @override
  final int productId;

  @override
  String toString() {
    return 'RoutineStepDto(id: $id, timeOfDay: $timeOfDay, stepType: $stepType, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineStepDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            (identical(other.stepType, stepType) ||
                other.stepType == stepType) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, timeOfDay, stepType, productId);

  /// Create a copy of RoutineStepDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutineStepDtoImplCopyWith<_$RoutineStepDtoImpl> get copyWith =>
      __$$RoutineStepDtoImplCopyWithImpl<_$RoutineStepDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutineStepDtoImplToJson(
      this,
    );
  }
}

abstract class _RoutineStepDto implements RoutineStepDto {
  const factory _RoutineStepDto(
      {required final int id,
      required final String timeOfDay,
      required final String stepType,
      required final int productId}) = _$RoutineStepDtoImpl;

  factory _RoutineStepDto.fromJson(Map<String, dynamic> json) =
      _$RoutineStepDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get timeOfDay; // morning | evening
  @override
  String get stepType; // cleanser | serum | cream | sunscreen | shampoo...
  @override
  int get productId;

  /// Create a copy of RoutineStepDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoutineStepDtoImplCopyWith<_$RoutineStepDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
