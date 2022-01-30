import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'add_product_request_model.g.dart';

@JsonSerializable()
class AddProductRequestModel {
  int? categoryId;
  String? productName;
  int? unitsInStock;
  int? unitPrice;

  AddProductRequestModel({this.categoryId, this.productName, this.unitsInStock, this.unitPrice});

  factory AddProductRequestModel.fromJson(Map<String, dynamic> json) => _$AddProductRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductRequestModelToJson(this);

  @override
  AddProductRequestModel fromJson(Map<String, dynamic> json) {
    return _$AddProductRequestModelFromJson(json);
  }
}
