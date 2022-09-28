import 'package:flutter/material.dart';
import '../../../services/utils.dart';
import '../../../widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  double textSize;
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;
  PriceWidget({
    super.key,
    this.textSize = 20,
    required this.salePrice,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
  });

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    double userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: "${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}\$",
            color: Colors.green,
            textSize: textSize,
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale,
            child: Text(
              "${(price * int.parse(textPrice)).toStringAsFixed(2)}\$",
              style: TextStyle(
                fontSize: textSize - 5,
                color: utils.color,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          )
        ],
      ),
    );
  }
}
