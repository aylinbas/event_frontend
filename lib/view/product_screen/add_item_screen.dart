import 'package:event_frontend/core/constants/image_constants.dart';
import 'package:event_frontend/model/add_product/request/add_product_request_model.dart';
import 'package:event_frontend/view/product_screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/product_screen_cubit.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final categoryController = TextEditingController();
    final stockController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Image.asset(ImageConstants.instance.pngAssets.flutterMarsLogo, fit: BoxFit.fill)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ürün Ekle",
                    style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Lütfen eklemek istediğiniz ürünün bilgilerini giriniz.",
                  style: TextStyle(color: Color.fromRGBO(165, 165, 165, 1)),
                ),
              ),
              inputRow(nameController, "Ürün Adı", context, "Ürün Adı"),
              inputRow(priceController, "Fiyat", context, "Fiyat"),
              inputRow(categoryController, "Kategori Id", context, "Kategori Id"),
              inputRow(stockController, "Stok Adedi", context, "Stok Adedi"),
              BlocProvider(
                create: (context) => ProductScreenCubit(),
                child: BlocConsumer<ProductScreenCubit, ProductScreenState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(30, 188, 253, 1)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ))),
                      onPressed: () async {
                        await context.read<ProductScreenCubit>().addItem(AddProductRequestModel(
                            productName: nameController.text,
                            unitPrice: int.parse(priceController.text),
                            categoryId: int.parse(categoryController.text),
                            unitsInStock: int.parse(stockController.text)));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Ürün Ekle",
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white)),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputRow(TextEditingController nameController, String name, BuildContext context, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: name,
          labelStyle: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: const Color.fromRGBO(217, 217, 217, 1), fontSize: 16),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)),
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
      ),
    );
  }
}
