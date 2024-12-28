import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/color_extension.dart';

class ExpolreCell extends StatelessWidget {

  final Map pObj;
  final VoidCallback onPressed;
  

  const ExpolreCell({super.key,required this.onPressed,required this.pObj,});


  @override
  Widget build(BuildContext context) {

    var color = (pObj['color'] as Color?  ?? TColor.primaryText);

    return  InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onPressed,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:  color.withOpacity(0.25),
            border: Border.all( color: BColor.list_button_border.withOpacity(0.5),width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      pObj['icon'],
                      width: 100,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                const Spacer(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(

                    textAlign: TextAlign.center,
                    pObj['name'],
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                const SizedBox(height: 10,)
              ]
          )
      ),
    );
  }
}