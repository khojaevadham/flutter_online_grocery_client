import 'package:dcgrocer/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class OrderIteamsRow extends StatelessWidget {

  final Map pObj;


  const OrderIteamsRow(
      {super.key,required this.pObj,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
    onTap: (){},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5,),
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: BColor.list_button_border , width: 1),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  pObj['icon'],
                  width: 60,
                  height: 80,
                  fit: BoxFit.fitHeight,
                ),
                // const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pObj["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: TColor.primaryText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        pObj["subt"],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: TColor.secondaryText,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      pObj["price"],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: TColor.blue_text,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      pObj["count"],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: TColor.secondaryText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}