import 'package:flutter/material.dart';

class GlobalMethods
{
  static navigateTo(BuildContext ctx, String routeName)
  {
    Navigator.pushNamed(
      ctx, 
      routeName,
    );
  }
}