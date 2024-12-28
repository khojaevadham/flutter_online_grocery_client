import 'dart:core';

import 'package:dcgrocer/common/color_extension.dart';
import 'package:dcgrocer/common_widget/product_cell2.dart';
import 'package:dcgrocer/model/cart_item_model.dart';
import 'package:dcgrocer/view_model/cart_view_model.dart';
import 'package:dcgrocer/view_model/home_view_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common_widget/product_cell.dart';
import '../../model/offer_product_model.dart';
import '../explore/explore_view.dart';
import 'product_detalis_view.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

  class _HomepageState extends State<Homepage> {


  int Selectindex = 0;
  bool _isActivity = false;

  void onButtonPress(int index) {

    setState(() {
      Selectindex = index;
      // if (Selectindex == 0) {
      //   _isActivity = true;        
      // }else if(Selectindex == 1){
      //   _isActivity = false;
      // }
    });
  }

  Widget _elevatedButton(String text , int index) {

    bool isSelected = Selectindex ==  index;

    return ElevatedButton(      
      
      onPressed: () => onButtonPress(index),
      style: ElevatedButton.styleFrom(

        backgroundColor: isSelected ? BColor.buttoncolor : BColor.appbar,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),),
         side: BorderSide(
           color: BColor.button_border,
           width: 1,),
        ),
       child: FittedBox(
        fit:  BoxFit.scaleDown,
         child: Text(
            text, 
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? TColor.button_text_on : TColor.button_text_off,
            ),
         ),
       )
      );
  }

  final CartViewModel cartVM = Get.find();
  final HomeViewModel homeVB = Get.find();


  @override
  void initState() {
    super.initState();
    Get.find<HomeViewModel>().serviceCallHome();
  }


  @override
  Widget build(BuildContext context) {

    // var media = MediaQuery.sizeOf(context).width;

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Colors.white,
        elevation: 0,
        shadowColor: Colors.black26,
        surfaceTintColor: Colors.white,
        title: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "Все товары",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                // fontFamily: "Roboto",
                fontWeight: FontWeight.w700),
          ),
        ),
        actions: [

          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'search_view');
            },
            icon:  SvgPicture.asset(
              "assets/img/icons/search_icon.svg",
              width: 27,
              height: 27,
            ),
          ),

          IconButton(
            onPressed: () {
              ExploreView_dialog();
              },
            icon:  SvgPicture.asset(
                "assets/img/icons/explore_icon.svg",
                width: 27,
                height: 27,
            ),
          ),
        ],
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            const  Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child:   FittedBox(
                 fit: BoxFit.contain,
                 child: Text(
                    'Ближайший магазин (улица Рудаки 25/1)',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto-Medium",
                    ),
                  ),
               ),
             ),

              const SizedBox(height:5),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    _elevatedButton('Все', 0),
                    const  SizedBox(width: 10,),
                    _elevatedButton('Соки', 1),
                    const SizedBox(width: 10,),
                    _elevatedButton('Газирование', 2),
                    const SizedBox(width: 10,),
                    _elevatedButton('Энергетики', 3 ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
              const SizedBox(height:5),
            ],
          )
        ),
      ),

        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/background_images/back_dc.png"),
                      fit: BoxFit.cover
                  )
              ),
             child: Stack(
              children: [

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // SizedBox(
                      //   height: 140,
                      //   child: Stack(
                      //     children: [
                      //
                      //       Positioned(
                      //         bottom: 12,
                      //         left: 0,
                      //         right: 0,
                      //         child: Container(
                      //           height: 24,
                      //           color: Colors.grey.shade400,
                      //         ),
                      //       ),
                      //
                      //       Obx(() =>
                      //           ListView.builder(
                      //             padding: const EdgeInsets.symmetric(horizontal: 8),
                      //             scrollDirection: Axis.horizontal,
                      //             itemCount: homeVB.offerArr.length,
                      //             itemBuilder: (context, index) {
                      //               var pObj = homeVB.offerArr[index];
                      //               return ProductCell(
                      //                 pObj: pObj,
                      //               onPressed: () async {
                      //                   show_productdetal(context, pObj);
                      //                   }
                      //               );
                      //             },
                      //           ),
                      //       )
                      //
                      //     ],
                      //   ),
                      // ),


                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 1,
                            mainAxisExtent: 290,
                          ),
                          itemCount: homeVB.offerArr.length,
                          itemBuilder: (context, index) {
                            var pObj = homeVB.offerArr[index];
                            return ProductCell2(
                              isselected: _isActivity,
                              pObj: pObj,
                              onPressed: ()  {
                                show_productdetal(context, pObj);
                              },
                            );
                          },
                        ),
                      ),





                      // SizedBox(
                      //   height: 140,
                      //   child: Stack(
                      //     children: [
                      //
                      //       Positioned(
                      //         bottom: 12,
                      //         left: 0,
                      //         right: 0,
                      //         child: Container(
                      //           height: 24,
                      //           color: Colors.grey.shade400,
                      //         ),
                      //       ),
                      //
                      //       ListView.builder(
                      //         padding: const EdgeInsets.symmetric(horizontal: 8),
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: itemArr.length,
                      //         itemBuilder: (context, index) {
                      //           var pObj = itemArr[index] as Map? ?? {};
                      //           return ProductCell(
                      //             onLongPress: (){
                      //               setState(() {
                      //
                      //               });
                      //             },
                      //             onPressed: () {
                      //               show_productdetal(context , pObj);
                      //             },
                      //             pObj: pObj,
                      //           );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //
                      // SizedBox(
                      //   height: 140,
                      //   child: Stack(
                      //     children: [
                      //
                      //       Positioned(
                      //         bottom: 12,
                      //         left: 0,
                      //         right: 0,
                      //         child: Container(
                      //           height: 24,
                      //           color: Colors.grey.shade400,
                      //         ),
                      //       ),
                      //
                      //       ListView.builder(
                      //         padding: const EdgeInsets.symmetric(horizontal: 8),
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: product_water.length,
                      //         itemBuilder: (context, index) {
                      //           var pObj = product_water[index] as Map? ?? {};
                      //           return ProductCell(
                      //             onPressed: () {
                      //               show_productdetal(context , pObj);
                      //             },
                      //             pObj: pObj,
                      //             onLongPress: () {
                      //               setState(() {
                      //
                      //               });
                      //             },
                      //           );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),


                      // const SizedBox(height: 105,)
                    ]
                ),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: DragTarget<Map<String, dynamic>>(
                            onAccept: (product) {
                              cartVM.addToCart(
                                  CartItemModel(
                                name: product['name'],
                                price: product['price'],
                                image: product['icon'],
                                description: product['description'],
                              ));
                              Get.snackbar('Товар Добавлен', "${product['name']}");
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 85,
                                    width: 85,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'MyCart');
                                      },
                                      backgroundColor: BColor.button_border,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/img/icons/icon_cart.png",
                                            width: 37,
                                            height: 37,
                                          ),
                                          Obx(
                                                () => Container(
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 7, vertical: 3),
                                                  height: 20,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: BColor.white_cont,
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Text(
                                                    '${cartVM.totalPrice.toStringAsFixed(1)} c',
                                                    textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 7,
                                      right: 12,
                                      child: Obx(
                                            () => CircleAvatar(
                                              backgroundColor: TColor.red_contprice,
                                              radius: 10,
                                              child: Text(
                                              '${cartVM.totalItem}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      )


               ],
              ),
            ),
          ],
        ),
      );
    }

  void  ExploreView_dialog(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        builder: (context) {
          return  const  ExploreView();}
    );
  }

  void show_productdetal(BuildContext context, OfferProductModel pObj) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return ProductDetalistView(
          pObj: pObj,
        );
      },
    );
  }



  }
