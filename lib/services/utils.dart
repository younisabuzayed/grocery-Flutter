import 'package:flutter/material.dart';
import 'package:grocery/provider/theme_dark_provider.dart';
import 'package:provider/provider.dart';

class Utils 
{
  BuildContext context;
  Utils(this.context);
  
  bool get getTheme => Provider.of<ThemeDarkProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  double get width => MediaQuery.of(context).size.width; 
  double get height => MediaQuery.of(context).size.height; 
}