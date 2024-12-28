
import 'package:dcgrocer/view/accaunt/order_history/order_history.dart';
import 'package:dcgrocer/view/explore/explore_view.dart';
import 'package:dcgrocer/view/explore/search_view.dart';
import 'package:dcgrocer/view/home/home_view.dart';
import 'package:dcgrocer/view/market/market_search_view.dart';
import 'package:dcgrocer/view/my_cart/my_cart_view.dart';
import 'package:dcgrocer/view/accaunt/location/location.dart';
import 'package:dcgrocer/view/accaunt/my_profile/myprofile.dart';
import 'package:dcgrocer/view/splashscreen.dart';
import 'package:dcgrocer/view_model/address_view_model.dart';
import 'package:dcgrocer/view_model/cart_view_model.dart';
import 'package:dcgrocer/view_model/home_view_model.dart';
import 'package:dcgrocer/view_model/product_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'view/explore/filter_view.dart';
import 'view/accaunt/chat_history/chat_history_view.dart';
import 'view/my_cart/order_view.dart';


void main()  {
  Get.put(CartViewModel());
  Get.put(AddressViewModel());
  Get.put(HomeViewModel());
  // Get.put(ProductDetailViewModel());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const  SplashScreen(),
        'homepage' : (context) =>  Homepage(),
        'location' : (context) =>  const Location(),
        'MyCart' : (context) =>  const MyCartView(),
        'explore' : (context) =>  const ExploreView(),
        'chat_history' : (context) =>  const ChatHistory(),
        'filtr_view'    : (ocntext)=> const FilterView(),
        'order_view' : (context)=> const OrderView(),
        'my_profile' : (context) => const MyProfile(),
        'order_history' : (context)=> const OrderHistory(),
        'search_view' : (context)=> const SearchView(),
        'market_search_view' : (context)=> const MarketSearchView(),
        // '/order_detalis' : (context)=> const OrderDetalis(eObj: ,)
      },
      getPages: [
        GetPage(name: '/', page: ()=> const SplashScreen())
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DC Grocery",
      theme: ThemeData(
          fontFamily:  "Roboto",
          useMaterial3: false,
        ),
      home: const SplashScreen(),
    );
  }
}