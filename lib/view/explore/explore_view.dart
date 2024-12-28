import 'package:dcgrocer/common_widget/expolre_cell.dart';
import 'package:dcgrocer/view/explore/explore_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../common/color_extension.dart';


class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
TextEditingController txtSearch = TextEditingController();


  List  exploreList = [
      {
        "name" : "Фрукты и овощи",
        "icon":  "assets/img/apple.png",
        "color" :  const  Color(0xff53B175)
      },
       {
        "name" : "Напитки",
        "icon":  "assets/img/can.png",
         "color" :  const  Color(0xffF8A44C)
      },
       {
        "name" : "Молочные продукты",
        "icon":  "assets/img/milk.png",
         "color" :  const  Color(0xffB7DFF5)
      },
      {
        "name" : "Бакалея",
        "icon":  "assets/img/cereals.png",
        "color" :  const  Color(0xffD3B0E0)
      },
        {
        "name" : "Кофе и чай",
        "icon":  "assets/img/coffee.png",
          "color" :  const  Color(0xFFFDE598)
      },
        {
        "name" : "Колбасы и мясо",
        "icon":  "assets/img/beef.png",
          "color" :  const  Color(0xffF7A593)
      },
        {
        "name" : "Кондитерские изделия",
        "icon":  "assets/img/cake.png",
          "color" :  const  Color(0xffB7DFF5)
      },
        {
        "name" : "Консервир. продукты",
        "icon":  "assets/img/canned_food.png",
          "color" :  const  Color(0xff53B175)
        },
    ];

  @override
   Widget build(BuildContext context) {

      MediaQuery.sizeOf(context);
      return Container(
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                     topLeft:Radius.circular(20),
                     topRight: Radius.circular(20)
                 ),
               ),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/icons/handle.png",
                            width: 40,
                            height: 20,
                        )
                      ],
                    ),

                    // const SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                             "Категории",
                           style: TextStyle(
                             color: TColor.primaryText,
                             fontWeight: FontWeight.w700,
                             fontSize: 18
                           ),
                         )
                       ],
                     ),

                    const SizedBox(height: 10,),

                     Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                           ),
                          itemCount: exploreList.length,
                          itemBuilder: ((context, index) {
                            var eObj = exploreList[index] as Map ? ?? {};
                            return ExpolreCell(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ExploreDetailView(eObj: eObj),
                                //   ),
                                // );
                              },
                    pObj: eObj,
                  );
                }),
              ),
            ),
          ],
        ),
      );

      }
}