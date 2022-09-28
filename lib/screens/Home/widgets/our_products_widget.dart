import 'package:flutter/material.dart';
import 'package:grocery/screens/OurProuducts/our_products_screen.dart';
import 'package:grocery/services/global_methods.dart';
import '../widgets/feed_items.dart';
import '../../../services/utils.dart';
import '../../../widgets/text_widget.dart';

class OurProductsWidget extends StatelessWidget {
  const OurProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: "Our Product", 
                color: Colors.black, 
                textSize: 22,
                isTitle: true,
              ),
              TextButton(
                onPressed: () => GlobalMethods.navigateTo(context, OurProducts.routeName), 
                child: const Text("Browse All"),
              )
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          childAspectRatio: utils.width /( utils.height * 0.55),
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          crossAxisCount: 2,
          children: List.generate(4, (index) => FeedItems()),),
      ],
    );
  }
}

