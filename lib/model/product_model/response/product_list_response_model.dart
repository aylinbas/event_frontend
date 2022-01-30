import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../product/product_model.dart';

part 'product_list_response_model.g.dart';

@JsonSerializable()
class ProductListResponseModel extends INetworkModel<ProductListResponseModel> {
  List<Data>? data;
  bool? success;
  String? message;

  ProductListResponseModel({this.data, this.success, this.message});

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) => _$ProductListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListResponseModelToJson(this);

  @override
  ProductListResponseModel fromJson(Map<String, dynamic> json) {
    return _$ProductListResponseModelFromJson(json);
  }
}
