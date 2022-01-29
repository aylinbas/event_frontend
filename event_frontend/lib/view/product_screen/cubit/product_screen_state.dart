part of 'product_screen_cubit.dart';

@immutable
abstract class ProductScreenState {}

class ProductScreenInitial extends ProductScreenState {}

class ProductScreenLoading extends ProductScreenState {}

class ProductScreenCompleted extends ProductScreenState {
  final dynamic response;

  ProductScreenCompleted(this.response);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductScreenCompleted && other.response == response;
  }
}

class ProductScreenStateError extends ProductScreenState {
  final String message;
  ProductScreenStateError(this.message);
}
