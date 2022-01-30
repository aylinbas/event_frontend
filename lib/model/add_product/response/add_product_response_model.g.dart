// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponseModel _$AddProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddProductResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddProductResponseModelToJson(
        AddProductResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
