
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/Account/account_screen.dart';
import 'package:grocery/screens/Cart/cart_screen.dart';
import 'package:grocery/screens/Categories/categories_screen.dart';
import 'package:grocery/screens/Home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_dark_provider.dart';

class RootBottomNavigator extends StatefulWidget {
  const RootBottomNavigator({super.key});

  @override
  State<RootBottomNavigator> createState() => _RootBottomNavigatorState();
}

class _RootBottomNavigatorState extends State<RootBottomNavigator> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  List<Widget> _screens = <Widget>[
    HomeScreen(),
    Categories(),
    Cart(),
    Account(),
  ];
  final List<Map<String, dynamic>> _listItems = [
    {
      "icon" : const Icon(IconlyLight.home),
      "icon-bold" : const Icon(IconlyBold.home),
      "label": "Home",
    },
    {
      "icon" : const Icon(IconlyLight.category),
      "icon-bold" : const Icon(IconlyBold.category),

      "label": "Category",
    },
    {
      "icon" : const Icon(IconlyLight.buy),
      "icon-bold" : const Icon(IconlyBold.buy),
      "label": "Cart",
    },
    {
      "icon" : const Icon(IconlyLight.user2),
      "icon-bold" : const Icon(IconlyBold.user2),
      "label": "Account",
    },
  ];
  void selectedScreen (int index)
  {
    setState(() {
          _selectedIndex = index;
      });
  }
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeDarkProvider>();
    bool isDark = themeState.getDarkTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: 
        isDark 
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: 
            isDark
              ? Theme.of(context).cardColor 
              : Colors.white,
          type: BottomNavigationBarType.fixed,
          items: _listItems.map((item){
            int idx = _listItems.indexOf(item);
            return BottomNavigationBarItem(
            icon: item[_selectedIndex == idx ? "icon-bold": "icon"],
            label: item["label"]
            // title
          );
          }).toList(),
          currentIndex: _selectedIndex,
          onTap: selectedScreen,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: 
            isDark
              ? Colors.lightBlue.shade200
              : Colors.black,
          unselectedItemColor: 
            isDark 
              ? Colors.white60 
              : Colors.grey[800],
    
        ),
        body:  _screens.elementAt(_selectedIndex),
      ),
    );
  }
}
