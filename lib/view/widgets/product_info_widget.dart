import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  final String? productName;
  final int? stock;
  final double? unitPrice;
  final int? categoryId;
  const ProductInfoWidget({Key? key, this.productName, this.stock, this.unitPrice, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromRGBO(230, 232, 236, 1)), borderRadius: BorderRadius.circular(8))),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#0' + categoryId.toString(),
                  style: TextStyle(color: Color.fromRGBO(230, 232, 236, 1), fontSize: 12),
                ),
                Text(
                  'Stok:' + stock.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productName ?? '',
                  style: TextStyle(color: Color.fromRGBO(30, 188, 253, 1), fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₺' + unitPrice.toString(),
                  style: TextStyle(color: Color.fromRGBO(79, 191, 103, 1), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }
}
