import 'package:dcgrocer/same_widgets/round_button.dart';
import 'package:dcgrocer/view/my_cart/success_view.dart';
import 'package:dcgrocer/view_model/address_view_model.dart';
import 'package:dcgrocer/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../common/color_extension.dart';
import '../../common_widget/payment_row.dart';

class PayDeliverView extends StatefulWidget {
  const PayDeliverView({super.key});

  @override
  State<PayDeliverView> createState() => _PayDeliverViewState();
}

class _PayDeliverViewState extends State<PayDeliverView> {
  final CartViewModel cartVB = Get.find();
  final AddressViewModel addressVB = Get.find();

  List<Map<String, dynamic>> paylist = [
    {
      "id": "1",
      "icon": "assets/img/logotips/logo_dc_pay.svg",
      "title": "DC NEXT",
      "subtitle": "Автоплатеж с кошелка DC Wallet",
      "ball": "+12 баллов",
    },
    {
      "id": "2",
      "icon": "assets/img/logotips/logo_nalichka.svg",
      "title": "Оплата наличными",
      "subtitle": "При получении заказа",
      "ball": "+5 баллов",
    },
  ];

  String selectedID = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("assets/img/back_andr.png", height: 20, width: 20),
        ),
        title: Text(
          "Оплата и доставка",
          style: TextStyle(color: TColor.primaryText, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background_images/back_dc.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Способы оплаты",
                  style: TextStyle(color: TColor.text, fontSize: 19, fontWeight: FontWeight.w600),
                ),
                // const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: paylist.length,
                    itemBuilder: (context, index) {
                      return PaymentRow(
                      ID: paylist[index]["id"],
                          icon: paylist[index]["icon"],
                          title: paylist[index]["title"],
                          subtitle: paylist[index]["subtitle"],
                          ball: paylist[index]["ball"],
                          onPressed: () {
                          // print(selectID);
                          setState(() {
                              selectedID = paylist[index]["id"];
                           });
                          },
                          selectID: selectedID,
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Obx(() => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: BColor.white_cont, width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/img/logotips/logo_deliver_car.svg",
                            width: 70,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Адрес доставки",
                                style: TextStyle(
                                    color: TColor.primaryText, fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Текущий адрес: ${addressVB.saveSelectedAddress(addressVB.selectedAddress.value.toString())}",
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 11, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                "Итого: ${cartVB.totalPrice} сомони",
                                style: TextStyle(
                                    color: TColor.shop_text_button, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundButton(
                      title: "Оформить",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SuccessView()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  // void _openUrl() async {
  //   const url = 'https://pay.dc.tj?a=&s=&f1=346'; // ваш URL
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }


}
//    Text('Способы оплаты',style: TextStyle(color: TColor.primaryText, fontSize: 16,fontWeight: FontWeight.w600),),