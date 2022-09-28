// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery/screens/Categories/widgets/category_item_widget.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class Categories extends StatelessWidget {
  final List<Map<String, dynamic>> _list = [
    {
      "title": "Fruits",
      "image":"assets/images/fruits.png",
    },
    {
      "title": "Vegetables",
      "image":"assets/images/veg.png",
    },
    {
      "title": "Herbs",
      "image":"assets/images/Spinach.png",
    },
    {
      "title": "Nuts",
      "image":"assets/images/nuts.png",
    },
    {
      "title": "Spices",
      "image":"assets/images/spices.png",
    },
    {
      "title": "Grains",
      "image":"assets/images/grains.png",

    },
  ];
  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).color;
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuery.width,
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text:"Categories",
                  textSize: 22,
                  fontWeight: FontWeight.bold, 
                  color: color,
                ),
              ),
              const SizedBox( height: 10 ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: _list.map((e) {
                    return CategoryItem(
                      image: e["image"],
                      title: e["title"],
                    );
                }).toList(),
              ),
            )
          ],
        )),
      ),
    );
  }
}

