import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';


class AppbarTitleText extends StatelessWidget {
  final String text;
  final double size;

  const AppbarTitleText({
  super.key,
    required this.text,
     this.size  = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: size,
        color: TColor.appbar_title_text,
        fontFamily: "Roboto-Regular",
        fontWeight: FontWeight.w700
      ),
    );
  }
}
