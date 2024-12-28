import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class AccountRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const AccountRow(
      {super.key,
        required this.title,
        required this.icon,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 55,
                  height: 65,

                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),


               const Icon(
                 Icons.navigate_next,
               color: Colors.black26,
                size: 30 ,
               ),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black26,
          height:  1,
        ),
      ],
    );
  }
}