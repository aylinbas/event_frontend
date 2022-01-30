import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Data extends INetworkModel<Data> {
  int? productId;
  int? categoryId;
  String? productName;
  int? unitsInStock;
  double? unitPrice;

  Data({this.productId, this.categoryId, this.productName, this.unitsInStock, this.unitPrice});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  Data fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}
