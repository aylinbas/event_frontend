import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/add_product/request/add_product_request_model.dart';
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

  Future<void> addItem(AddProductRequestModel data) async {
    emit(ProductScreenLoading());
    try {
      final response = await repository.addItem(data);
      emit(ProductScreenCompleted(response));
    } catch (e) {
      emit(ProductScreenStateError(e.toString()));
    }
  }
}
