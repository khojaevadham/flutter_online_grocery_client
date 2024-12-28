import 'package:dcgrocer/view/home/home_view.dart';
// import 'package:dcmarket/view/home/home_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
// import '../accaunt/account_view.dart';
import '../accaunt/accaunt_view.dart';
import '../explore/explore_view.dart';
// import '../favorite/favorite_view.dart';
import '../favorite/favorite_view.dart';
import '../market/market_view.dart';
import '../my_cart/my_cart_view.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview> with 
SingleTickerProviderStateMixin{
  TabController? controller;  
   int selectTab = 0;

  @override 
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller!.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {
      });
    });
  }    

  @override
void dispose() {
  controller!.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),

      controller: controller,
      children: const [
        Homepage(),
        MarketView(),
        FavoritesView(),
        AccountView()
      ],
       ),
      bottomNavigationBar: Container(
        decoration: const  BoxDecoration(
          color: Colors.white,

          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(0,-2)
            )
          ]
        ),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          height: 65,
          color: Colors.white,
          elevation: 0,
          child: TabBar(
            // dividerColor: Colors.red,
            controller:  controller,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: BColor.buttoncolor,
            labelStyle: TextStyle(
              color: BColor.buttoncolor,
              fontSize: 11,
              fontWeight: FontWeight.w900
            ), 
            unselectedLabelColor: TColor.primaryText,
            unselectedLabelStyle: TextStyle(
              color: TColor.primaryText, 
              fontSize: 11,
              fontWeight: FontWeight.w600
            ),
            labelPadding: EdgeInsets.zero,
            tabs:  [
             Tab(
                    text: "Главная",
                    icon: Image.asset(
                      "assets/img/store_tab.png",
                      width: 25,
                      height: 25,
                      color: selectTab == 0 ? BColor.buttoncolor : TColor.primaryText,
                    ),
                  ),
                  Tab(
                    text: "Супермаркеты",
                    icon: Image.asset(
                      "assets/img/supermarket.png",
                      width: 25,
                      height: 25,
                       color: selectTab == 1 ? BColor.buttoncolor : TColor.primaryText,
                    ),
                  ),
                  Tab(
                    text: "Избранное",
                    icon: Image.asset(
                      "assets/img/fav_tab.png",
                      width: 25,
                      height: 25,
                       color: selectTab == 2 ? BColor.buttoncolor : TColor.primaryText,
                    ),
                  ),
                  Tab(
                    text: "Аккаунт",
                    icon: Image.asset(
                      "assets/img/account_tab.png",
                      width: 25,
                      height: 25,
                       color: selectTab == 3 ? BColor.buttoncolor : TColor.primaryText,
                    ),
                  )
            ]
          ),
        ),
      ),
    );
  }
}