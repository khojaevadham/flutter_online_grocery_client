import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import '../model/offer_product_model.dart';

class ProductCell2 extends StatelessWidget {
  final OfferProductModel pObj;
  final bool  isselected;
  final VoidCallback onPressed;

  const ProductCell2({
    super.key,
    required this.pObj,
    required this.isselected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var media  =  MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
           child: Container(
             padding: const EdgeInsets.all(25),
             height: 180,
             width: media.size.width / 2,
             decoration: BoxDecoration(
               color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   border: Border.all(
                       color: BColor.white_cont),
             ),
             child: Image.asset(
               pObj.icon ?? "",
               fit: BoxFit.contain,
             ),
           ),
         ),
         const SizedBox(height: 10),
         Text(
           pObj.name ?? "",
           style: TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.w500,
               color: TColor.primaryText
           ),
         ),
        // const SizedBox(height: 5),
        Text(
          pObj.unit ?? "",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: TColor.primaryText
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 40,
          width: media.size.width / 2.7,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                color: BColor.white_cont,
            width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // if(isselected == true)
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.remove),  color: TColor.blue_text, iconSize: 25,),
                  Text(
                    "${pObj.price.toString()} см",
                    style: TextStyle(
                      fontSize: 15,
                        fontWeight: FontWeight.w500,
                      color: TColor.blue_text
                    ),
                  ),
                  Icon(Icons.add, color: TColor.blue_text, size: 25,),
              ],
            ),
          ),
        )

      ],
    );
    // return Container(
    //   padding: const EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(15),
    //     border: Border.all(
    //         color: BColor.white_cont),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.shade200,
    //         offset: const Offset(0, 4),
    //         blurRadius: 8,
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         child: GestureDetector(
    //           onTap: onPressed,
    //           child: Container(
    //             padding:  const EdgeInsets.all(10),
    //             decoration: BoxDecoration(
    //               color: Colors.grey.shade200,
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Center(
    //               child: Image.asset(
    //                 pObj.icon ?? "",
    //                 fit: BoxFit.contain,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       // Название продукта
    //       Text(
    //         pObj.name ?? "",
    //         style:  TextStyle(
    //           fontSize: 14,
    //           fontWeight: FontWeight.w500,
    //           color: TColor.primaryText
    //         ),
    //       ),
    //       const SizedBox(height: 5),
    //       // Объем
    //       Text(
    //         "1,5 л.",
    //         style: TextStyle(
    //           fontSize: 12,
    //           color: TColor.secondaryText,
    //         ),
    //       ),
    //       const SizedBox(height: 10),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             "${pObj.price} сомони",
    //             style:  TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.bold,
    //               color: TColor.blue_text,
    //             ),
    //           ),
    //           // Кнопка "+"
    //           GestureDetector(
    //             onTap: () {
    //               // Логика добавления товара
    //             },
    //             child: Container(
    //               padding: const EdgeInsets.all(6),
    //               decoration: BoxDecoration(
    //                 color: TColor.blue_text,
    //                 shape: BoxShape.circle,
    //               ),
    //               child: const Icon(
    //                 Icons.add,
    //                 color: Colors.white,
    //                 size: 20,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
