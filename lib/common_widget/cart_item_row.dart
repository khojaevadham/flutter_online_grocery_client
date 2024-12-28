import 'package:dcgrocer/model/cart_item_model.dart';
import 'package:dcgrocer/same_widgets/big_text.dart';
import 'package:dcgrocer/same_widgets/small_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/color_extension.dart';

class CartItemRow extends StatelessWidget {

  final CartItemModel cObj;
  final Function onDismissed;


  const CartItemRow({
    super.key,
    required this.cObj,
    required this.onDismissed
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cObj.name ?? ""),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDismissed();
      },
      background: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: TColor.dissimsred,
          border: Border.all(color: BColor.list_button_border , width: 1),
          borderRadius: BorderRadius.circular(19),
        ),
        alignment: Alignment.centerRight,
        child: SvgPicture.asset(
          'assets/img/icons/delete_icon.svg',
          width: 35,
          height: 35,
        )
      ),


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
                  cObj.image ?? "",
                  width: 60,
                  height: 75,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: cObj.name ?? "",
                        size: 16,
                      ),

                      const SizedBox(height: 5),

                      DescriptionText(
                        text: cObj.description ?? "" ,
                        size:  14,
                      ),

                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${cObj.price} см",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: TColor.blue_text,
                        fontSize: 16,
                        fontFamily: "Roboto-Medium",
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      cObj.qty.toString() + " штука" ,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontFamily: "Roboto-Medium",
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
