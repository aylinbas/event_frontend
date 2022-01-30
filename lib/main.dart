import 'package:flutter/material.dart';

import 'view/product_screen/product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Sample Project'),
          ),
          body: ProductScreen()),
    );
  }
}
