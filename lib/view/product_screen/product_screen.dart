import 'package:event_frontend/core/constants/image_constants.dart';
import 'package:event_frontend/model/add_product/request/add_product_request_model.dart';
import 'package:event_frontend/model/add_product/response/add_product_response_model.dart';
import 'package:event_frontend/view/product_screen/add_item_screen.dart';
import 'package:event_frontend/view/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
    return Scaffold(
      body: BlocProvider(
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
              ProductListResponseModel response = state.response.data;
              return productList(
                  context, nameController, priceController, categoryController, stockController, response);
            } else if (state is ProductScreenStateError) {
              return Container(
                child: Text(state.message),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
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
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Image.asset(ImageConstants.instance.pngAssets.flutterMarsLogo, fit: BoxFit.fill)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ürünler",
                  style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color>(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(237, 251, 255, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddItem()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        ImageConstants.instance.svgAssets.plusIcon,
                      ),
                      Text("Ürün Ekle", style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 14)),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Eklediğiniz ürünleri ve bilgilerini aşağıdaki listede görebilirsiniz.",
                style: TextStyle(color: Color.fromRGBO(165, 165, 165, 1)),
              ),
            ),

            // addProduct(context, nameController, priceController, categoryController, stockController),
            Expanded(
              child: ListView.builder(
                  itemCount: response.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductInfoWidget(
                      productName: response.data?[index].productName,
                      stock: response.data?[index].unitsInStock,
                      unitPrice: response.data?[index].unitPrice,
                      categoryId: response.data?[index].categoryId,
                    );
                  }),
            ),
          ],
        ));
  }
}
