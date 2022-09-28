import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/Cart/widgets/bottom_header_widget.dart';
import 'package:grocery/screens/Cart/widgets/cart_item.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: TextWidget(
          text: "Cart (2)",
          color: utils.color,
          textSize: 22,
          isTitle: true,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyLight.delete,
              color: utils.color,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          BottomHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: const CartItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

