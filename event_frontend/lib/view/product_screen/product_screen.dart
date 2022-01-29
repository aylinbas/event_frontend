import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/product_model/response/product_list_response_model.dart';
import 'cubit/product_screen_cubit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductScreenCubit(),
      child: BlocConsumer<ProductScreenCubit, ProductScreenState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProductScreenInitial) {
            context.read<ProductScreenCubit>().getProductList();
          }
          if (state is ProductScreenLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductScreenCompleted) {
            ProductListResponseModel response = state.response.data;
            return Container(
                decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primaryVariant),
                        borderRadius: BorderRadius.circular(8))),
                child: ListView.builder(
                    itemCount: response.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(response.data?[index].productName ?? '');
                    }));
          } else if (state is ProductScreenStateError) {
            return Container(
              child: Text(state.message),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
