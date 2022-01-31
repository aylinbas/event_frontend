import 'package:vexana/vexana.dart';

import '../../../core/utility/endpoint_utils.dart';
import '../../../init/network/concrete/network_manager.dart';
import '../../../model/add_product/request/add_product_request_model.dart';
import '../../../model/add_product/response/add_product_response_model.dart';
import '../../../model/product_model/response/product_list_response_model.dart';

class ProductScreenRepository {
  Future<IResponseModel<ProductListResponseModel?>> getProducts() async {
    final networkService = await NetworkService.instance.networkManager;

    final response = await networkService.send<ProductListResponseModel, ProductListResponseModel>(
      Endpoints.baseUrl.rawValue,
      parseModel: ProductListResponseModel(),
      method: RequestType.GET,
    );
    return response;
  }

  Future<IResponseModel<AddProductResponseModel?>> addItem(AddProductRequestModel data) async {
    final networkService = await NetworkService.instance.networkManager;

    final response = await networkService.send<AddProductResponseModel, AddProductResponseModel>(Endpoints.add.rawValue,
        parseModel: AddProductResponseModel(), method: RequestType.POST, data: data.toJson());
    return response;
  }
}
