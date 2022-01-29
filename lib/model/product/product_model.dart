class Product {
  int? productId;
  int? categoryId;
  String? productName;
  int? unitsInStock;
  double? unitPrice;

  Product({this.productId, this.categoryId, this.productName, this.unitsInStock, this.unitPrice});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['categoryId'];
    productName = json['productName'];
    unitsInStock = json['unitsInStock'];
    unitPrice = json['unitPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['categoryId'] = this.categoryId;
    data['productName'] = this.productName;
    data['unitsInStock'] = this.unitsInStock;
    data['unitPrice'] = this.unitPrice;
    return data;
  }
}
