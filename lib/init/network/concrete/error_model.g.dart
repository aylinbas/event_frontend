// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIErrorModel _$APIErrorModelFromJson(Map<String, dynamic> json) =>
    APIErrorModel()
      ..errors =
          (json['errors'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$APIErrorModelToJson(APIErrorModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
