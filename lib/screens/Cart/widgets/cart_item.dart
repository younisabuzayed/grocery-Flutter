import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/favorite_btn_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

import './quantity_button_widget.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final TextEditingController _quantityTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityTextController.text = "1";
  }
  @override
  void dispose() {
    super.dispose();
    _quantityTextController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Container(
                    height: utils.width * 0.20,
                    width: utils.width * 0.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FancyShimmerImage(
                      imageUrl:
                          "https://images.unsplash.com/photo-1550258987-190a2d41a8ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  SizedBox( width: utils.width * 0.015 ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox( height: 10),
                      TextWidget(
                        text: "Title", 
                        color: utils.color, 
                        textSize: 20,
                      ),
                      const SizedBox( height: 10),
                      Container(
                        width: utils.width * 0.35,
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            QuantityButton(
                              icon: const Icon(
                                Icons.add, 
                                color: Colors.white,
                              ),
                              color: Colors.green,
                              onTap: () {},
                              ),
                            const SizedBox( width: 10,),
                            Flexible(
                              flex: 1,
                              child: TextField(
                                controller: _quantityTextController,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  )
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                                ],
                                onChanged: (v) {
                                  setState(() {
                                    if(v.isEmpty)
                                    {
                                      _quantityTextController.text = '1';
                                    }
                                    else
                                    {
                                      return;
                                    }
                                  });
                                },
                              )
                            ),
                            const SizedBox( width: 10,),
                            QuantityButton(
                              icon: const Icon(
                                Icons.remove, 
                                color: Colors.white,
                              ),
                              color: Colors.red,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox( height: 10),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.cart_badge_minus,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        const SizedBox( height:  5,),
                        const FavoriteBtn(),
                        const SizedBox( height:  5,),
                        TextWidget(
                          text: '2.5 \$', 
                          color: utils.color, 
                          textSize: 15
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

