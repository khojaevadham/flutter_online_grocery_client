// import 'package:dcgrocer/common_widget/product_cell.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// import '../../common/color_extension.dart';
//
//
// class ExploreDetailView extends StatefulWidget {
//
//   final Map eObj;
//
//   const ExploreDetailView({super.key, required this.eObj});
//
//   @override
//   State<ExploreDetailView> createState() => _ExploreDetaliViewState();
// }
//
// class _ExploreDetaliViewState extends State<ExploreDetailView> {
// TextEditingController txtSearch = TextEditingController();
//
//
//  List  listArr = [
//       {
//         "name" : "Яблоко зеленый",
//         "icon":  "assets/img/products/apple_green.png",
//         "qty": "1",
//         "unit" :  "кг Цена",
//         "price" : "10.00 см",
//       },
//       {
//         "name" : "Яблоко красный",
//         "icon":  "assets/img/products/app_red.png",
//         "qty": "1",
//         "unit" :  "кг Цена",
//         "price" : "17.00 см",
//       },
//       {
//         "name" : "Лимон",
//         "icon":  "assets/img/products/limon.png",
//         "qty": "1",
//         "unit" :  "шт Цена",
//         "price" : "8.00 см",
//       },
//        {
//         "name" : "Груша",
//         "icon":  "assets/img/products/grusha.png",
//         "qty": "1",
//         "unit" :  "шт Цена",
//         "price" : "20.00 см",
//       },
//        {
//         "name" : "Яблоко Голден",
//         "icon":  "assets/img/products/golden.png",
//         "qty": "1",
//         "unit" :  "шт Цена",
//         "price" : "23.00 см",
//       },
//       {
//         "name" : "Яблоко Макинтош",
//         "icon":  "assets/img/products/app_makin.png",
//         "qty": "1",
//         "unit" :  "шт Цена",
//         "price" : "30.00 см",
//       },
//        {
//         "name" : "Апельсин",
//         "icon":  "assets/img/products/apelsin.png",
//         "qty": "1",
//         "unit" :  "шт Цена",
//         "price" : "25.00 см",
//       },
//     ];
//
//
//   @override
//    Widget build(BuildContext context) {
//
//       MediaQuery.sizeOf(context);
//
//     return Scaffold(
//       appBar:
//       AppBar(
//         // elevation: 0.5,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         shadowColor: Colors.black26,
//         surfaceTintColor: Colors.white,
//         // leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:  Image.asset("assets/img/back.png", height: 20,width: 20,)),
//         leading:  IconButton(
//           onPressed: (){Navigator.pop(context);},
//            icon:  Image.asset("assets/img/back_andr.png", height: 20,width: 20,)),
//         title: Text(
//                      widget.eObj["name"].toString(),
//                       style: TextStyle(color: TColor.primaryText, fontSize: 20, fontWeight: FontWeight.w700),
//                       ),
//       ),
//       body:
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/img/background_images/back_dc.png"),
//                 fit: BoxFit.cover
//               )
//             ),
//             child:
//                 GridView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//                     gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio:  0.75,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: listArr.length,
//                     itemBuilder: ((context, index){
//                        var pObj = listArr[index] as Map ? ?? {};
//                        return ProductCell(
//                         onPressed: (){},
//                         pObj: pObj,
//                         onCat:(){},
//                         margin: 0,
//                         weight: double.maxFinite,
//                          );
//                       }
//                      )
//                     )
//           ),
//         );
//       }
// }