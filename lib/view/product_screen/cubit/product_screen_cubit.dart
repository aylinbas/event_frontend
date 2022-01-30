import 'package:bloc/bloc.dart';
import 'package:event_frontend/model/add_product/request/add_product_request_model.dart';
import 'package:event_frontend/model/add_product/response/add_product_response_model.dart';
import 'package:event_frontend/model/product/product_model.dart';
import 'package:meta/meta.dart';

import '../repository/product_screen_repository.dart';

part 'product_screen_state.dart';

class ProductScreenCubit extends Cubit<ProductScreenState> {
  ProductScreenCubit() : super(ProductScreenInitial());

  final repository = ProductScreenRepository();

  Future<void> getProductList() async {
    emit(ProductScreenLoading());
    try {
      final response = await repository.getProducts();
      emit(ProductScreenCompleted(response));
    } catch (e) {
      emit(ProductScreenStateError(e.toString()));
    }
  }

  Future<void> getById(AddProductRequestModel data) async {
    emit(ProductScreenLoading());
    try {
      final response = await repository.getProductsById(data);
      emit(ProductScreenCompleted(response));
    } catch (e) {
      emit(ProductScreenStateError(e.toString()));
    }
  }
}
