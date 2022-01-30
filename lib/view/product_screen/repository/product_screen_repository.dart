import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:vexana/vexana.dart';
import 'package:http/http.dart' as http;
import '../../../core/utility/endpoint_utils.dart';
import '../../../init/network/concrete/network_manager.dart';
import '../../../model/product_model/response/product_list_response_model.dart';
import 'package:dio/dio.dart';

class ProductScreenRepository {
  Future<IResponseModel<ProductListResponseModel?>> getProducts() async {
    // var response;
    // Dio dio = new Dio();
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    // try {
    //   response = await dio.get(Endpoints.baseUrl.rawValue);
    //   print(response);
    // } catch (e) {
    //   print(e);
    // }
    // return response;
    final networkService = await NetworkService.instance.networkManager;

    final response = await networkService.send<ProductListResponseModel, ProductListResponseModel>(
      Endpoints.baseUrl.rawValue,
      parseModel: ProductListResponseModel(),
      method: RequestType.GET,
    );
    return response;
  }
}
