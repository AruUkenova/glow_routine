// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_step_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoutineStepDtoImpl _$$RoutineStepDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoutineStepDtoImpl(
      id: (json['id'] as num).toInt(),
      timeOfDay: json['timeOfDay'] as String,
      stepType: json['stepType'] as String,
      productId: (json['productId'] as num).toInt(),
    );

Map<String, dynamic> _$$RoutineStepDtoImplToJson(
        _$RoutineStepDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeOfDay': instance.timeOfDay,
      'stepType': instance.stepType,
      'productId': instance.productId,
    };
