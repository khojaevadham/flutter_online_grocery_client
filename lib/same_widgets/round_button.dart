import 'package:dcgrocer/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

  class RoundButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const RoundButton({super.key, required this.title, required this.onPressed,});

    @override
    Widget build(BuildContext context) {
      return MaterialButton(
        onPressed: onPressed,
        height: 60,
        minWidth: double.maxFinite,
        color: BColor.buttoncolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // elevation: 12,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Roboto-Medium",
          ),
        )
      );
    }
  }

  class RoundButtonshop extends StatelessWidget {

  final String title;
  final String icon;
  final VoidCallback onPressed;

  const RoundButtonshop({
    super.key,
    required this.title,
    required this.onPressed ,
    required this.icon,});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      minWidth: double.maxFinite,
      elevation: 0,
      color:  BColor.button_border,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                // fontWeight: FontWeight.w600,
                fontFamily: "Roboto-Medium",
            ),
          ),
            const SizedBox(width: 10,),
          SvgPicture.asset(
            icon ,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}