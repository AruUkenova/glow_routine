// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String,
      openedAt: DateTime.parse(json['openedAt'] as String),
      pAoMonths: (json['pAoMonths'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'openedAt': instance.openedAt.toIso8601String(),
      'pAoMonths': instance.pAoMonths,
      'price': instance.price,
    };
