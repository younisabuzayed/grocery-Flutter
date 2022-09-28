import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../OnSale/on_sale_screen.dart';
import '../../services/global_methods.dart';
import '../../constants/global_data.dart';
import './widgets/list_products.dart';
import './widgets/swiper_box.dart';
import 'widgets/our_products_widget.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
void navigatorToOnSale(BuildContext context)
{
  Navigator.pushNamed(
    context, 
    OnSale.routeName,
  );
}
class _HomeScreenState extends State<HomeScreen> {
  final GlobalData _globalData = GlobalData();
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperBox(utils: utils, listImage: _globalData.listSwiperImage),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => GlobalMethods.navigateTo(context, OnSale.routeName), 
                child: Text("View All"),
              ),
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On Sale".toUpperCase(), 
                        color: Colors.red, 
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(width: 5,),
                      const Icon(IconlyLight.discount, color: Colors.red,)
                    ],
                  ),
                ),
                const Flexible(
                  child: ListProducts(),
                ),
              ],
            ),
            const SizedBox( height: 10,),
            OurProductsWidget()
          ]
        ),
      ),
    );
  }
}

