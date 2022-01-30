import 'package:event_frontend/model/add_product/request/add_product_request_model.dart';
import 'package:event_frontend/model/add_product/response/add_product_response_model.dart';
import 'package:event_frontend/model/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/product_model/response/product_list_response_model.dart';
import 'cubit/product_screen_cubit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final categoryController = TextEditingController();
    final stockController = TextEditingController();
    return BlocProvider(
      create: (context) => ProductScreenCubit(),
      child: BlocConsumer<ProductScreenCubit, ProductScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductScreenInitial) {
            context.read<ProductScreenCubit>().getProductList();
          }
          if (state is ProductScreenLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductScreenCompleted) {
            if (state.response.data is AddProductResponseModel) {
              return productAdded(state, context);
            } else {
              ProductListResponseModel response = state.response.data;
              return productList(
                  context, nameController, priceController, categoryController, stockController, response);
            }
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

  Container productList(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController priceController,
      TextEditingController categoryController,
      TextEditingController stockController,
      ProductListResponseModel response) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            addProduct(context, nameController, priceController, categoryController, stockController),
            Expanded(
              child: ListView.builder(
                  itemCount: response.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.all(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(response.data?[index].productName ?? ''),
                            Text(response.data?[index].unitPrice.toString() ?? ''),
                          ],
                        ));
                  }),
            ),
          ],
        ));
  }

  Widget addProduct(BuildContext context, TextEditingController nameController, TextEditingController priceController,
      TextEditingController categoryController, TextEditingController stockController) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.primaryVariant),
              borderRadius: BorderRadius.circular(8))),
      child: Column(
        children: [
          inputRow(nameController, "Ad"),
          inputRow(priceController, "Fiyat"),
          inputRow(categoryController, "Kategori Id"),
          inputRow(stockController, "Stok Adedi"),
          Container(
            width: 30,
            child: FloatingActionButton(
              onPressed: () {
                context.read<ProductScreenCubit>().getById(AddProductRequestModel(
                    productName: nameController.text,
                    unitPrice: int.parse(priceController.text),
                    categoryId: int.parse(categoryController.text),
                    unitsInStock: int.parse(stockController.text)));
              },
              child: Icon(Icons.plus_one),
            ),
          )
        ],
      ),
    );
  }

  Row inputRow(TextEditingController nameController, String name) {
    return Row(
      children: [
        Expanded(child: Text(name)),
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: nameController,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Center productAdded(ProductScreenCompleted state, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.response.data?.message ?? ''),
          FloatingActionButton(
            child: Icon(Icons.get_app),
            onPressed: () {
              context.read<ProductScreenCubit>().getProductList();
            },
          )
        ],
      ),
    );
  }
}
