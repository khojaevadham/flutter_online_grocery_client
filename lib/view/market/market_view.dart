import 'package:dcgrocer/common_widget/market_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/color_extension.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {

  List market = [
    {
      "icon" : "assets/img/icons/Paykar.png",
    },
    {
      "icon" : "assets/img/icons/ashan.png",
    },
    {
      "icon" : "assets/img/icons/yovar.png",
    },
    {
      "icon" : "assets/img/icons/bi1.png",
    },
    {
      "icon" : "assets/img/icons/ashan.png",
    },
    {
      "icon" : "assets/img/icons/Paykar.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'DC Market',
              style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w700,
                color: TColor.primaryText),
             ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/img/icons/search_icon.svg",
              width: 25,
              height: 25,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'market_search_view');
            },
          ),
        ],
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      children: [
                           Container(
                            height: 170,
                            decoration: BoxDecoration(
                              color : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: BColor.list_button_border, width: 1)
                            ),
                            child: Stack(
                                children: [
                                Padding(
                                padding: const EdgeInsets.all(9),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Экспресс доставка",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: TColor.primaryText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                                Padding(
                                  padding: const EdgeInsets.only(bottom: 40, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Покупка из\nближайшего магазина",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: TColor.secondaryText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: BColor.buttoncolor,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft: Radius.circular(30),
                                                  bottomRight: Radius.circular(30),
                                                ),
                                              ),
                                              child: const Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Собрать корзину",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  Icon(Icons.navigate_next_rounded, size: 30, color: Colors.white),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                  Image.asset(
                                    "assets/img/icons/food.png",
                                    width: 185,
                                    height: 185,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                           )
                      ],
                    ),
                  ),

               const SizedBox(height: 10,),

                  Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Супермаркеты',
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ],
                  ),

                const SizedBox(height: 20,),

                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: market.length,
                    itemBuilder: ((context, index){
                      var pObj = market[index] as Map? ?? {};
                      return MarketRow(
                        onPressed: (){},
                        icon: market[index]["icon"],
                      );
                    }
                )
              ),

                const SizedBox(height: 20)

              ],
            ),
          ),
    );
  }
}
