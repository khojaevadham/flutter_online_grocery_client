import 'package:dcgrocer/same_widgets/appbar_title_text_style.dart';
import 'package:dcgrocer/view/accaunt/order_history/order_detalis.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/chat_history_row.dart';
import '../../../common/color_extension.dart';
import '../../../common_widget/order_history_row.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {

  List  order_list = [
    {
      "datetime": "21.09.2024 16:06",
      "icon":  "assets/img/logotips/dcchat.png",
      "title": "Экспресс",
      "status" :  "В пути",
      "price": "250 сом"
    },
    {
      "datetime": "01.09.2024 16:07",
      "icon":  "assets/img/logotips/ashan.png",
      "title": "Ашан",
      "status" :  "Доставлен",
      "price": "220 сом"
    },
    {
      "datetime": "21.09.2024 16:06",
      "icon":  "assets/img/logotips/dcchat.png",
      "title": "Экспресс",
      "status" :  "Отменен",
      "price": "20 сом"
    },
    {
      "datetime": "21.09.2024 16:06",
      "icon":  "assets/img/logotips/paykar.png",
      "title": "Пайкар",
      "status" :  "Отменен",
      "price": "10 сом"
    },
    {
      "datetime": "21.09.2024 16:06",
      "icon":  "assets/img/logotips/dcchat.png",
      "title": "Экспресс",
      "status" :  "Доставлен",
      "price": "550 сом"
    },
    {
      "datetime": "28.10.2024 ",
      "icon":  "assets/img/logotips/ashan.png",
      "title": "Ашан",
      "status" :  "Доставлен",
      "price": "200 сом"
    },
  ];

  @override
  Widget build(BuildContext context) {

    String previousDate = '';
    return Scaffold(

      appBar: AppBar(
        backgroundColor:  Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        // elevation: 0.5,
        // leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:  Image.asset("assets/img/back.png", height: 20,width: 20,)),
        leading:  IconButton(
            onPressed: (){Navigator.pop(context);},
            icon:  Image.asset(
              "assets/img/back_andr.png",
              height: 20,width: 20,)
        ),
        title: const AppbarTitleText(
            text: "Заказы",
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const  EdgeInsets.all(10),
          // margin: EdgeInsets.only(left: 10,right: 10),
          decoration: const BoxDecoration(
              image:  DecorationImage(
                  image: AssetImage("assets/img/background_images/back_dc.png"),
                  fit: BoxFit.cover)
          ),
        child: Column(
          children: [
            ListView.builder(
                itemCount: order_list.length,
              shrinkWrap: true,
                itemBuilder: ((context, index) {

                  var eObj = order_list[index] as Map? ?? {};
                  Map<String, String> order = order_list[index];
                  String currentDate = order['datetime']?.split(' ')[0] ?? '';

                  bool shouldShowDate = currentDate != previousDate;
                  previousDate = currentDate;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (shouldShowDate && currentDate.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: Text(
                            currentDate,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                            color: TColor.primaryText),
                          ),
                        ),
                      OrderHistoryRow(
                        icon: order_list[index]['icon'],
                        title: order_list[index]['title'],
                        status: order_list[index]['status'],
                        price: order_list[index]['price'],
                        onPressed: () {
                          Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>  OrderDetalis(eObj: eObj,),
                           ),
                          );
                        },
                      ),
                    ],
                  );
                }
                )
            )
          ],
        ),
      ),
    );
  }
}