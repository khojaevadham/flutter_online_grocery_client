
import 'package:dcgrocer/common/color_extension.dart';
import 'package:dcgrocer/same_widgets/round_button.dart';
import 'package:dcgrocer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/cart_item_model.dart';
import '../../model/offer_product_model.dart';
import '../../same_widgets/big_text.dart';
import '../../same_widgets/small_text_widget.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_detail_view_model.dart';


class ProductDetalistView extends StatefulWidget {

  final OfferProductModel pObj;

  const ProductDetalistView({
    super.key,
    required this.pObj,
  });

  @override
  State<ProductDetalistView> createState() => _ProductDetalistViewState();
}

class _ProductDetalistViewState extends State<ProductDetalistView> {

  late ProductDetailViewModel detailVM;
  final HomeViewModel homeVM  =  Get.find();

  @override
  void initState() {
    super.initState();
    detailVM = Get.put(ProductDetailViewModel(widget.pObj));
  }

  @override
  void dispose() {
    Get.delete<ProductDetailViewModel>();
    super.dispose();
  }

  // bool isselected = false;
  // int qty = 1;

  final CartViewModel cartController = Get.find();


  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.sizeOf(context);

    return  Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height /2,
        padding: const EdgeInsets.all(20),
      decoration: const  BoxDecoration(
        color: Color.fromRGBO(248, 250, 255, 1),
        // color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Column(
        children: [
        Container(
          // width: media.width ,
          height: media.height *0.23,
          decoration:  BoxDecoration(
               image: const DecorationImage(
                   image: AssetImage(
                       'assets/img/background_images/back_product_cart.png',),
                   fit: BoxFit.cover
               ),
            borderRadius: BorderRadius.circular(24)
          ),
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_before_rounded, size: 50,)),
              const Spacer(),
              Image.asset(
                  // widget.productImages,
                  detailVM.pObj.icon ?? "",
                  width: media.width * 0.3,
                  height: media.height * 0.2
              ),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,size: 50,)),
           ],
          ),
        ),
        const SizedBox(height: 10,),

         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                BigText(
                  text: detailVM.pObj.name ?? "",
                ),

                Obx(() =>
                    IconButton(
                      icon: Icon(
                        size: 25,
                        detailVM.pObj.isFav == true ?
                        Icons.favorite : Icons.favorite_border,
                        color: detailVM.pObj.isFav == true
                            ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        homeVM.callserverAddRemoveFavorite(detailVM.pObj);
                      },
                    ),
                )
              ],
              ),


            Row(
            children: [
               // const  Padding(padding:  EdgeInsets.only(left: 5),),
              DescriptionText(
               text: detailVM.pObj.description ?? "",
              )
              // Text(
              //   detailVM.pObj.description ?? "",
              //   style: TextStyle(
              //       color: TColor.subtitle,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600),
              // ),
            ],
          ),

           const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

           // const   Padding(padding:  EdgeInsets.only(left: 5),),
              Text(
              "${detailVM.pObj.price} сомони/шт",
                style: TextStyle(
                    color:  TColor.blue_text,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto-Medium",
                ),
              ),

                 Container(
                   margin: const EdgeInsets.only(bottom: 5),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  // padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            detailVM.addSubQTY(
                              isAdd: false
                            );
                          },
                          icon: SvgPicture.asset(
                            'assets/img/icons/minus_sv.svg',
                            width: 25,
                            height: 25,)
                      ),
                       Obx(() =>
                           Text(
                             detailVM.qty.value.toString(),
                             style: const TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,
                                 fontWeight: FontWeight.w500,
                             ),
                           ),
                       ),

                      IconButton(
                          onPressed: (){
                             detailVM.addSubQTY(
                               isAdd: true
                             );
                          },
                          icon: SvgPicture.asset(
                            'assets/img/icons/plus_sv.svg',
                            width: 25,
                            height: 25,
                          )
                      ),
                    ],
                  ),
              ),
            ],
          ),

          ]
         ),


          const Spacer(),
        RoundButtonshop(
          title: 'Добавить в корзину',
          onPressed: (){
            final item = CartItemModel(
              name: detailVM.pObj.name,
              image:detailVM.pObj.icon,
              price: detailVM.pObj.price,
              totalPrice: (detailVM.pObj.price! * detailVM.qty.value),
              qty: detailVM.qty.value,
                description: detailVM.pObj.description
            );

            cartController.addToCart(item);
            print( detailVM.pObj.name.toString() + ' добавлен в корзину ' + ' кол ' + detailVM.qty.value.toString());
            Navigator.pop(context);

            Get.snackbar('Товар добавлен', '${detailVM.pObj.name}');
          },

          icon: 'assets/img/icons/add_detalis_cart.svg', )
      ],)
    );
  }
}