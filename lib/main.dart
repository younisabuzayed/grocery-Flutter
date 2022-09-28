import 'package:flutter/material.dart';
import 'package:grocery/screens/OnSale/on_sale_screen.dart';
import 'package:grocery/screens/OurProuducts/our_products_screen.dart';
import './constants/theme_data.dart';
import './navigation/BottomNavigation/root_bottom_navigation.dart';
import './provider/theme_dark_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeDarkProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeDarkProvider themeChangeProvider = ThemeDarkProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDarkProvider>(
      builder: (context, themeProvider, child)  {
        return MaterialApp(
          title: 'Grocery',
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const RootBottomNavigator(),
          routes: {
            OnSale.routeName: (ctx) => const OnSale(),
            OurProducts.routeName: (ctx) => const OurProducts(),
          },
        );
      },
    );
  }
}
