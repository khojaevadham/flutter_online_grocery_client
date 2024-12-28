
import 'package:dcgrocer/common_widget/cart_item_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/color_extension.dart';
import '../../view_model/cart_view_model.dart';
import 'deliver_addres.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {

  final CartViewModel cartVM = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

            appBar: AppBar(
              // automaticallyImplyLeading: false,
              leading:  IconButton(
                  onPressed: (){Navigator.pop(context);},
                  icon:  Image.asset(
                    "assets/img/back_andr.png",
                    height: 20,width: 20,)
              ),
              // shadowColor: Colors.black54,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Кассовая зона',
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              )
            ),
          ),
          // backgroundColor: BColor.appbar,

          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/background_images/back_dc.png"),
                    fit: BoxFit.cover
                )
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [

                 Obx(() => ListView.builder(
                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                   itemCount: cartVM.listArr.length,
                   itemBuilder: ((context, index) {
                      var cObj =  cartVM.listArr[index];
                       return CartItemRow(
                         cObj: cObj,
                         onDismissed: (){
                           cartVM.removeFromCart(index);
                         },
                       );
                   })
                 )
                 ),

                // SizedBox(height: 100,),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Obx(
                      ()=> Column(
                        mainAxisAlignment:  cartVM.listArr.isNotEmpty ? MainAxisAlignment.end : MainAxisAlignment.center,
                        children: [
                          cartVM.listArr.isNotEmpty
                              ? MaterialButton(
                                onPressed: (){
                                  Addres();
                                },
                                height: 60,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: BColor.buttoncolor,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                     const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         FittedBox(
                                          child:  Text(
                                            "Оформить заказ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),


                                    Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 5),
                                    child:  Text(
                                      "${cartVM.totalPrice.toStringAsFixed(2)}c",
                                      style:  TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                              ],
                            ),
                          )
                              : Text(
                                 'Корзина пуста',
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                  ),
                )

              ],
            ),
          )

    );
  }

   void   Addres() {
    showDialog(
      context: context,
      builder: (context) => const DeliverAddres(),
    );
  }

}