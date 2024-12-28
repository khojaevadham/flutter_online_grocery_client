import 'package:dcgrocer/common/color_extension.dart';
import 'package:dcgrocer/same_widgets/round_button.dart';
import 'package:flutter/material.dart';

import 'pay_deliver_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Stack(
          children: [
            Image.asset("assets/img/background_images/back_dc.png", width: media.width,height: media.height, fit: BoxFit.cover,),
            Center(                
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(            
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               
                  Image.asset(
                    'assets/img/logotips/dc_logo.png',
                    width: media.width*0.5,),

                    const SizedBox(height: 30,),
                  Text(                    
                    textAlign: TextAlign.center,
                    'Для оплаты покупки нужно привязывать DC wallet ',
                    style: TextStyle(color: TColor.primaryText,fontWeight: FontWeight.w500, fontSize: 18),
                    ),

                  const SizedBox(height: 40,),
                    RoundButton(title: 'Привязать DC wallet', onPressed:  (){Navigator.push(context,MaterialPageRoute(builder:(context) => const PayDeliverView(),));}),
                  
                ],
              ),
            ), 
            
            ),
          ],
        )
    );
  }
}