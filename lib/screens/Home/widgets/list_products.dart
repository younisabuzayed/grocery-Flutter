import 'package:flutter/material.dart';
import 'package:grocery/screens/Home/widgets/on_sale_widget.dart';
import 'package:grocery/services/utils.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({Key? key}) : super(key: key);


  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  final List<Map<String, dynamic>> items = [
    {
      "title": "Apricots",
      "price": "3.74",
    }
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return SizedBox(
      height: utils.height * 0.20,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // final item = items[index];
          return OnSaleWidget();
        },
      ),
    );
  }
}