import 'package:flutter/cupertino.dart';

import '../common/color_extension.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;


  const BigText({
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
          color: TColor.primaryText,
          fontFamily: "Roboto-Medium",
          fontWeight: FontWeight.w600
      ),
    );
  }
}
