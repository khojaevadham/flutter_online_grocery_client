
import 'package:dcgrocer/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widget/favourite_row.dart';
import '../../same_widgets/round_button.dart';

import '../../common/color_extension.dart';


class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  final HomeViewModel homeVM =  Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Colors.white,
        elevation: 0,
        centerTitle: true,
        // shadowColor: Colors.black26,
        surfaceTintColor: Colors.white,
             
        title: Text(
          "Избранное",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        // bottom: const PreferredSize(
        //   preferredSize: Size.fromHeight(1),
        //   child: Divider(
        //     height: 0.7,
        //     thickness: 0.7,
        //     color: Colors.black26,
        //   ),
        // ),
      ),
      backgroundColor: Colors.white,          
    
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background_images/back_dc.png"),
                fit: BoxFit.cover
            )
        ),
        child: Obx(() =>
          homeVM.favArr.isEmpty ?
            Center(
              child: Text(
                'У вас нет избранный товары',
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            )
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [

                    ListView.separated(
                    padding: const  EdgeInsets.only(left: 20, top: 5, bottom: 75, right: 20),
                        itemCount: homeVM.favArr.length,
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.black26,
                              height: 1,
                            ),
                        itemBuilder: (context, index) {
                          var pObj = homeVM.favArr[index];
                          return FavoriteRow(
                            onPressed: (){},
                            pObj: pObj,
                          );
                        }),

                    Padding(
                            padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                           RoundButton(title: "Добавить в корзину", onPressed: (){

                    })
                  ],
                ),
              )
              ],
            ),
        )

      ),
    );
  }
}
