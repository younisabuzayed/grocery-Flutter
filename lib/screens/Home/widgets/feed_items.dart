import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/screens/Home/widgets/price_widget.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/favorite_btn_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class FeedItems extends StatefulWidget {
  const FeedItems({super.key});

  @override
  State<FeedItems> createState() => _FeedItemsState();
}

class _FeedItemsState extends State<FeedItems> {
  final TextEditingController _quantityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _quantityController.text = '1';
  }
  @override
  void dispose() {
    super.dispose();
    _quantityController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1550258987-190a2d41a8ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
                height: utils.width * 0.22,
                width: utils.width * 0.20,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Title Product",
                      color: utils.color,
                      textSize: 16,
                    ),
                    FavoriteBtn(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: PriceWidget(
                        textSize: 18,
                        isOnSale: true,
                        price: 20,
                        salePrice: 15,
                        textPrice: _quantityController.text,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                            child: TextWidget(
                              text: "KG",
                              color: utils.color,
                              textSize: 18,
                              isTitle: true,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: _quantityController,
                              key: const ValueKey('10'),
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                              ],
                              onChanged: (value) {
                                setState(() {
                                  
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only( 
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      )
                    )
                  ), 
                  child: TextWidget(
                    text: "Add",
                    maxLines: 1,
                    color: utils.color,
                    textSize: 20,
                  ),
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
