import 'package:bloc/bloc.dart';
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
}
