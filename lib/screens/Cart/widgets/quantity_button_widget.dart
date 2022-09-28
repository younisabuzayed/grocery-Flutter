import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final Icon icon;
  final Function()? onTap;
  final Color color;
  const QuantityButton({
    Key? key,
    required this.icon,
    required this.onTap, 
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: icon,
        ),
      ),
    );
  }
}
