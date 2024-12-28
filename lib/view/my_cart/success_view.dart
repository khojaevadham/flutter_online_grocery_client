import 'package:dcgrocer/view/home/home_view.dart';
import 'package:dcgrocer/view/main_tab_view/main_tabview.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../same_widgets/round_button.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Stack(
          children: [
            Image.asset("assets/img/background_images/back_dc.png",
             width: media.width,height: media.height, fit: BoxFit.cover,),
           
            Center(                
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(            
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               
                  Image.asset(
                    'assets/img/icons/success_icon.png',
                    width: media.width*0.5,),

                    // const SizedBox(height: 30,),
                  Text(                    
                    textAlign: TextAlign.center,
                    'Спасибо, Ваш заказ принят!',
                    style: TextStyle(color: TColor.primaryText,fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                     Text(                    
                    textAlign: TextAlign.center,
                    'Ваш заказ оформлен. Наш консультант свяжется с вами. Номер вашего заказа: ${250737}',
                    style: TextStyle(color: TColor.secondaryText,fontWeight: FontWeight.w500, fontSize: 14),
                    ),

                    const SizedBox(height: 30,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(
                                'Ваш закупщик',
                                style: TextStyle(color: TColor.primaryText,fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                     ],
                   ),

                      const SizedBox(height: 5,),

                   Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: BColor.white_cont, width: 1 ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset("assets/img/logotips/men.png", width: 70, height: 90 ,  fit: BoxFit.contain, ),
                               const SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Аличон Шерматов",
                                    style:  TextStyle(
                                    color: TColor.primaryText, fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4,),
                                  Text(
                                    "+992 904 25 25 26",
                                    style:  TextStyle(
                                        color: TColor.secondaryText, fontSize: 13, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            const   Spacer(),
                               IconButton(onPressed: (){}, icon: Image.asset("assets/img/icons/phone_call.png",
                                 width: 25, height: 25,))
                                  ],
                                ),
                              ),
                            ),  
                        ],
                      ),
                    ),
              ),
            
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
               child: Column(              
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [                
                   RoundButton(title: 'Вернуться в магазин', onPressed:  (){Navigator.push(context,MaterialPageRoute(builder:(context) => MainTabview(),));}),
                 ],
               ),
             ),
          ],
        )
    );
  }
}