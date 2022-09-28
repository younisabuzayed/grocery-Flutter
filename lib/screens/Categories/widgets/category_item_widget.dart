import 'package:flutter/material.dart';
import 'package:grocery/provider/theme_dark_provider.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final themeState = context.watch<ThemeDarkProvider>();
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () => print('object'),
      child: Container(
        width: mediaQuery.width * 0.3,
        height: mediaQuery.width * 0.3,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: 
          themeState.getDarkTheme
            ? const Color.fromARGB(255, 110, 209, 255).withOpacity(0.5)
            : Colors.amber.withOpacity(0.1) 
        ),
        child: Column(
          children: [
            Container(
              width: mediaQuery.width * 0.3,
              height: mediaQuery.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              )
              ),
            ),
            TextWidget(
              text: title,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
      ),
                    ),
    );
  }
}
