import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_step_dto.freezed.dart';
part 'routine_step_dto.g.dart';

@freezed
abstract class RoutineStepDto with _$RoutineStepDto {
  const factory RoutineStepDto({
    required int id,
    required String timeOfDay, // morning | evening
    required String stepType,  // cleanser | serum | cream | sunscreen | shampoo...
    required int productId,
  }) = _RoutineStepDto;

  factory RoutineStepDto.fromJson(Map<String, dynamic> json) => _$RoutineStepDtoFromJson(json);
}