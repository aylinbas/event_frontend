import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'add_product_response_model.g.dart';

@JsonSerializable()
class AddProductResponseModel extends INetworkModel<AddProductResponseModel> {
  bool? success;
  String? message;

  AddProductResponseModel({this.success, this.message});

  factory AddProductResponseModel.fromJson(Map<String, dynamic> json) => _$AddProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductResponseModelToJson(this);

  @override
  AddProductResponseModel fromJson(Map<String, dynamic> json) {
    return _$AddProductResponseModelFromJson(json);
  }
}
