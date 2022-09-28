import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/Home/widgets/price_widget.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 5
      ),
      // width: utils.width * 0.35,
      height: utils.width * 0.35,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(10),
        color: Theme.of(context).cardColor.withOpacity(.9),
      ),
      child: InkWell(
          onTap: () => print("object"),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FancyShimmerImage(
                      imageUrl:"https://images.unsplash.com/photo-1550258987-190a2d41a8ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
                      height: utils.width * 0.20,
                      width: utils.width * 0.20,
                      boxFit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          TextWidget(
                            text: "1KG", 
                            color: utils.color,
                            textSize: 22,
                          ),
                          const SizedBox( height: 6,),
                          Row(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  IconlyLight.bag2,
                                  color: utils.color,
                                  size: 22,
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  IconlyLight.heart,
                                  color: utils.color,
                                  size: 22,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                  ],
                ),
                PriceWidget(
                  textSize: 18,
                  isOnSale: true,
                  price: 20,
                  salePrice: 15,
                  textPrice: '1',
                ),
                SizedBox( height: 6,),
                TextWidget(
                  text: "text", 
                  color: utils.color, 
                  textSize: 16,
                  isTitle: true,
                ),
                SizedBox( height: 6,),

              ]
            ),
          ),
        ),
    );
  }
}