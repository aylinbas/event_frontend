// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductRequestModel _$AddProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddProductRequestModel(
      categoryId: json['categoryId'] as int?,
      productName: json['productName'] as String?,
      unitsInStock: json['unitsInStock'] as int?,
      unitPrice: json['unitPrice'] as int?,
    );

Map<String, dynamic> _$AddProductRequestModelToJson(
        AddProductRequestModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'productName': instance.productName,
      'unitsInStock': instance.unitsInStock,
      'unitPrice': instance.unitPrice,
    };
