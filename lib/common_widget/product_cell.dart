import 'package:dcgrocer/common/color_extension.dart';
import 'package:dcgrocer/model/offer_product_model.dart';
import 'package:flutter/material.dart';


class ProductCell extends StatelessWidget {
  final OfferProductModel pObj;
  final VoidCallback onPressed;

  const ProductCell({
    super.key,
    required this.onPressed,
    required this.pObj,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: () => onPressed(),
      child: Draggable<Map<String, dynamic>>(
        data: pObj.toJson(),
        feedback: Material(
          color: Colors.transparent,
          child: Image.asset(
            pObj.icon ?? "assets/img/default_icon.png",
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
        ),
          child:  Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Image.asset(
                        pObj.icon ?? "",
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 7,
                      right: 7,
                      child: Container(
                        height: 23,
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: TColor.red_contprice,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "${pObj.price.toString()} с/шт" ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

      ),
    );
  }
}


