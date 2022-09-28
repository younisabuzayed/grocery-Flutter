import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/services/utils.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
  
    return  GestureDetector(
      child: Icon(
        IconlyLight.heart,
        color: utils.color,
        size: 22,
      ),
    );
  }
}