// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListResponseModel _$ProductListResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductListResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProductListResponseModelToJson(
        ProductListResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };
