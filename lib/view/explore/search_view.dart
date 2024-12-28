
import 'package:dcgrocer/same_widgets/round_button.dart';
import 'package:dcgrocer/common_widget/search_item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../common/color_extension.dart';
import '../../common_widget/product_cell.dart';
import '../main_tab_view/main_tabview.dart';


class SearchView extends StatefulWidget {

  const SearchView({super.key, });

  @override
  State<SearchView> createState() => _SearchState();
}

class _SearchState extends State<SearchView> {

  int Selectindex = 0;

  void onButtonPress(int index) {

    setState(() {
      Selectindex = index;
      // if (Selectindex == 0) {
      //   _isActivity = true;
      // }else if(Selectindex == 1){
      //   _isActivity = false;
      // }
    });
  }
  TextEditingController txtSearch = TextEditingController();


  Widget _elevatedButton(String text , int index) {

    bool isSelected = Selectindex ==  index;

    return ElevatedButton(

        onPressed: () => onButtonPress(index),
        style: ElevatedButton.styleFrom(

          backgroundColor: isSelected ? BColor.buttoncolor : BColor.appbar,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24),),
          side: BorderSide(
            color: BColor.button_border,
            width: 1,),
        ),
        child: FittedBox(
          fit:  BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? TColor.button_text_on : TColor.button_text_off,
            ),
          ),
        )
    );
  }


 List  searcharr = [
   // {
   //   "product_name": "Фрукты и овощы",
   // },
        {
          "name" : "Яблоко зеленый",
          "icon":  "assets/img/products/apple_green.png",
          "icon2":  "assets/img/icons/galochka.svg",
          'description' : 'Product',
          "price" : "10.00 см",
          "bonus" : "+2 баллов",
        },
        {
          "name" : "Лимон",
          "icon":  "assets/img/products/limon.png",
          "icon2":  "assets/img/icons/galochka.svg",
          'description' : 'Product',
          "price" : "8.00 см",
          "bonus" : "+2 баллов",
        },
       {
        "name" : "Груша",
        "icon":  "assets/img/products/grusha.png",
         'description' : 'Product',
        "price" : "20.00 см",
      },
       {
        "name" : "Яблоко Голден",
        "icon":  "assets/img/products/golden.png",
         'description' : 'Product',
        "price" : "23.00 см",
      },
      {
        "name" : "Яблоко Макинтош",
        "icon":  "assets/img/products/app_makin.png",
        'description' : 'Product',
        "price" : "30.00 см",
      },
       {
        "name" : "Апельсин",
        "icon":  "assets/img/products/apelsin.png",
         'description' : 'Product',
        "price" : "25.00 см",
      },
     {
       "name" : "Груша",
       "icon":  "assets/img/products/grusha.png",
       'description' : 'Product',
       "price" : "20.00 см",
     },
     {
       "name" : "Яблоко Голден",
       "icon":  "assets/img/products/golden.png",
       'description' : 'Product',
       "price" : "23.00 см",
     },
  ];


  @override
   Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/background_images/back_dc.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: txtSearch,
                    cursorColor: Colors.black54,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 7),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/img/back_andr.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Поиск",
                      hintStyle: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/img/icons/search_2.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    _elevatedButton('Все', 0),
                    const SizedBox(width: 10),
                    _elevatedButton('Голден', 1),
                    const SizedBox(width: 10),
                    _elevatedButton('Красные', 2),
                    const SizedBox(width: 10),
                    _elevatedButton('Гренни смит', 3),
                    const SizedBox(width: 10),
                  ],
                ),
              ),

              const SizedBox(height: 5),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemCount: searcharr.length,
                  itemBuilder: (context, index) {
                    var sObj = searcharr[index] as Map ?? {};
                    return SearchItemRow(sObj: sObj);
                  },
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: RoundButton(
              title: "Открыт полку",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainTabview()));

              },
            ),
          ),
        ],
      ),
    );


  }
}