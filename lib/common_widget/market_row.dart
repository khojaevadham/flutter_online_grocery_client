import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class MarketRow extends StatelessWidget {
   final VoidCallback onPressed;
   final String icon;

  const MarketRow({super.key, required this.onPressed, required this.icon });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(19)),
          color: Colors.white,
          border: Border.all(color: BColor.list_button_border, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 100, height: 90 ,  fit: BoxFit.contain, ),
          ],
        ),
      ),
    );
  }
}
