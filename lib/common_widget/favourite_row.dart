
import 'package:dcgrocer/model/offer_product_model.dart';
import 'package:dcgrocer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common/color_extension.dart';


class FavoriteRow extends StatelessWidget {
  final OfferProductModel pObj;
  final VoidCallback onPressed;

   FavoriteRow(
      {
        super.key,
      required this.pObj,
      required this.onPressed
      });

  final HomeViewModel homeVM  = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                // CachedNetworkImage(
                //   imageUrl: pObj.image ?? "",
                //   placeholder: (context, url) => const Center(
                //     child: CircularProgressIndicator(),
                //   ),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                //    width: 60,
                //   height: 60,
                //   fit: BoxFit.contain,
                // ),
                  Image.asset(
                    pObj.icon ?? "",
                    width: 60,    
                    height: 80,
                    fit: BoxFit.contain,
                  ),

                const SizedBox(
                  width: 5,
                ),

                Expanded(
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pObj.name ?? "",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        IconButton(
                          onPressed: (){
                            homeVM.callserverAddRemoveFavorite(pObj);
                          },
                          icon: const  Icon(Icons.close,
                            size: 25,
                            color: Colors.black,
                          ),
                          ),
                        ],
                      ),

                      // const SizedBox(
                      //   height: 0,
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pObj.description ?? "",
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),

                          Text(
                            "${pObj.price} сомони",
                            style: TextStyle(
                                color: TColor.blue_text,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),

                          // const Icon(
                          //   Icons.navigate_next,
                          //   color: Colors.black26,
                          //   size: 35 ,
                          // ),
                        ],
                      ),



                    ],
                  ) ,
                ),

                const SizedBox(
                  width: 8,
                ),


              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black26,
          height: 1,
        ),
      ],
    );
  }
}
