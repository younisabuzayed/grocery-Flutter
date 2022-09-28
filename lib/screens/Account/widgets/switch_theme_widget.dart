import 'package:flutter/material.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_dark_provider.dart';

class SwitchThemeWidget extends StatefulWidget {
  final String title;

  const SwitchThemeWidget({
    Key? key, 
    required this.title,
    }) : super(key: key);
  @override
  State<SwitchThemeWidget> createState() => _SwitchThemeWidgetState();
}

class _SwitchThemeWidgetState extends State<SwitchThemeWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeDarkProvider>();
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return SwitchListTile(
      value: themeState.getDarkTheme, 
      title: TextWidget(
        text: widget.title, 
        color: color, 
        textSize: 22,
        ),
      secondary: Icon(
        themeState.getDarkTheme 
          ? Icons.dark_mode_outlined
          : Icons.light_mode_outlined
      ),
      onChanged: (bool val) {
        setState(() {
        themeState.setDarkTheme = val;
          
      });
      },);
  }
}