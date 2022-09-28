import 'package:flutter/material.dart';
import '../Home/widgets/on_sale_widget.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class OnSale extends StatelessWidget {
  static const routeName = "/on-sale-screen";
  const OnSale({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSaleEmpty = true;
    final utils = Utils(context);
    return Scaffold(
      appBar: AppBar(
          title: TextWidget(
            text: 'Products on sales',
            color: utils.color,
            textSize: 22,
            isTitle: true,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: utils.color,
          
          elevation: 0,
      ),
      body: isSaleEmpty 
        ?  Center(
          child: TextWidget(
            text: "No products on sale",
            color: utils.color,
            textSize: 28,
          ),
        )
        // ignore: dead_code
        : GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            childAspectRatio: utils.width / (utils.height * 0.40),
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            crossAxisCount: 2,
            children: List.generate(10, (index) => OnSaleWidget()),
          ),
    );
  }
}
