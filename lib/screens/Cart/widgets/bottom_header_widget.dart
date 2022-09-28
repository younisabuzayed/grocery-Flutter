import 'package:flutter/material.dart';
import 'package:grocery/services/utils.dart';
import 'package:grocery/widgets/text_widget.dart';

class BottomHeader extends StatelessWidget {
  const BottomHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8
        ),
        child: Row(
          children: [
            Material(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  child: TextWidget(
                    text:"Order Now",
                    color: Colors.white,
                    textSize: 20,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: "Total: \$ 200", 
                color: utils.color, 
                textSize: 18, 
                isTitle: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
