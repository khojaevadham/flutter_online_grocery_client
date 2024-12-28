import 'package:flutter/cupertino.dart';

import '../common/color_extension.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final double size;


  const DescriptionText({
    super.key,
    required this.text,
    this.size  = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
          fontSize: size,
          color: TColor.secondaryText,
          fontFamily: "Roboto-Medium",
          fontWeight: FontWeight.w600
      ),
    );
  }
}
