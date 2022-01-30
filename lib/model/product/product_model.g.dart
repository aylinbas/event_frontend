// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      productId: json['productId'] as int?,
      categoryId: json['categoryId'] as int?,
      productName: json['productName'] as String?,
      unitsInStock: json['unitsInStock'] as int?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'productId': instance.productId,
      'categoryId': instance.categoryId,
      'productName': instance.productName,
      'unitsInStock': instance.unitsInStock,
      'unitPrice': instance.unitPrice,
    };
