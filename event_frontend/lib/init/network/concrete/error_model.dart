import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'error_model.g.dart';

@JsonSerializable()
class APIErrorModel extends INetworkModel<APIErrorModel> {
  late List<String> errors;

  @override
  Map<String, dynamic> toJson() => _$APIErrorModelToJson(this);

  @override
  APIErrorModel fromJson(Map<String, dynamic> json) {
    return _$APIErrorModelFromJson(json);
  }
}
