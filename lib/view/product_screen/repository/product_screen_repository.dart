import 'package:vexana/vexana.dart';

import '../../../core/utility/endpoint_utils.dart';
import '../../../init/network/concrete/network_manager.dart';
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
}
