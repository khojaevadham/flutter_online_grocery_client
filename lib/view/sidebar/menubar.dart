//
// import 'package:dcgrocer/common/color_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// // import 'package:dcmarket/database/database.dart';
//
// class menubar extends StatefulWidget {
//   const menubar({super.key});
//
//   @override
//   State<menubar> createState() => _menubarState();
// }
//
//
// class _menubarState extends State<menubar> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Drawer(
//       backgroundColor: BColor.background,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: ListView(
//           children: [
//
//                   // SizedBox(height: 10,),
//                    Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                   // SizedBox(height: 40,),
//                             GestureDetector(
//                               onTap: () {Navigator.pushNamed(context, '/profile');},
//                               child: Container(
//                                 color: Colors.transparent,
//                                 width: MediaQuery.of(context).size.width,
//                                 height: 80,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: EdgeInsets.only(top: 10, left: 20),
//                                       width: 70,
//                                       height: 70,
//                                       decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color:  Color.fromRGBO(4, 107, 213, 0.2)
//                                       ),
//                                       child: Center(child: Text("ББ",style: TextStyle(color: BColor.buttoncolor,fontSize: 30,fontWeight:FontWeight.w500 ),) ,),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 25,left: 10),
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                             //  '${users[0]['name']?.substring(0, 1)}${users[0]['surname']?.substring(0, 1)}',
//                                             'Бобохонов Бобочон',
//                                             style: TextStyle(color: TColor.menutext,fontSize: 16, fontWeight:  FontWeight.w600),),
//                                           // SizedBox(height: 5,),
//                                           Text("+992 904 64 65 66", style: TextStyle(fontWeight: FontWeight.w400,color: TColor.menutext),)
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//
//              const SizedBox(height: 20,),
//
//              ListTile(
//                   onTap: () {},
//                   leading: const Image(image: AssetImage('assets/img/icons/shop_icon.png')),
//                   title:  Text('Магазины',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//              ListTile(
//                   onTap: () {},
//                   leading: const Image(image: AssetImage('assets/img/icons/history_icon.png')),
//                   title: Text('История заказов',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//              ListTile(
//                   onTap: () {DialogAdd();},
//                   leading: const Image(image: AssetImage('assets/img/icons/phone_icon.png')),
//                   title:   FittedBox( fit: BoxFit.scaleDown, child: Text('Доп.номер телефона',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),),
//                   subtitle: Text('+992 919 21 22 23 ',style: TextStyle(color: TColor.subtitle),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//              ListTile(
//                   onTap: () {Navigator.pushNamed(context, '/location');},
//                   leading: const Image(image: AssetImage('assets/img/icons/location_icon.png')),
//                   title:  Text('Адреса',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),
//                   subtitle: Text('ул. Рудаки 23',style: TextStyle(color: TColor.subtitle),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//              ListTile(
//                   onTap: () {},
//                   leading:const Image(image: AssetImage('assets/img/icons/vitrina_icon.png')),
//                   title:  Text('Выбор вид витрины ',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//              ListTile(
//                   onTap: () {},
//                   leading: const Image(image: AssetImage('assets/img/icons/listdoc_icon.png')),
//                   title:  Text('Условия использования',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//              ListTile(
//                   onTap: () {DialogExit();},
//                   leading: const Image(image: AssetImage('assets/img/icons/logout_icon.png')),
//                   title:  Text('Выход',style: TextStyle(color: TColor.menutext,fontWeight: FontWeight.w600,fontSize: 16),),
//                   trailing: Icon(Icons.navigate_next_rounded, color: BColor.icon_next, size: 35,),
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ignore: non_constant_identifier_names
//   void  DialogExit() {
//     showDialog(
//       context: context,
//       builder: (context) => const Exitdialog(),
//     );
//   }
//
//   // ignore: non_constant_identifier_names
//    void DialogAdd() {
//     showDialog(
//       context: context,
//       builder: (context) =>  AddNumber(),
//     );
//   }
//
// }
//
//
//
// class Exitdialog extends StatefulWidget {
//
//   const Exitdialog({super.key,});
//
//   @override
//   State<Exitdialog> createState() => _ExitdialogState();
// }
//
// class _ExitdialogState extends State<Exitdialog> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//
//                    Text( 'Выход',
//                     style: TextStyle(color: TColor.text, fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                   const  SizedBox(height: 10),
//
//                    Text(
//                     'При выходе из приложении данные для входа и связь с кошельком DC wallet будут удалены.',
//                     style: TextStyle(color: TColor.subtitle, fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                  const  SizedBox(height: 10),
//
//                   Row(
//                     children: [
//                      const  Spacer(),
//                       TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Отмена",style: TextStyle(color: BColor.cancelbutton, fontSize: 15,fontWeight: FontWeight.w500),),),
//                       TextButton(onPressed: (){Navigator.pushNamed(context, "/");}, child: Text("Выйти",style: TextStyle(color: TColor.text,fontSize: 15,fontWeight: FontWeight.w500),))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//
//   class AddNumber extends StatelessWidget {
//
//    AddNumber({super.key,});
//
//     String hintText = '+992 888 777 788';
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//
//                    Text( 'Добавление номера',
//                     style: TextStyle(color: TColor.text, fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                   const  SizedBox(height: 10),
//
//                    Text(
//                     'Укажите  дополнительный номер телефона ',
//                     style: TextStyle(color: TColor.subtitle, fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                   const SizedBox(height: 10),
//
//                   TextField(
//                       decoration: InputDecoration(
//                         hintText: hintText,
//                        border: UnderlineInputBorder(
//                          borderRadius: BorderRadius.circular(1),
//                        )
//                       ),
//                     ),
//
//                   const SizedBox(height: 10),
//
//                   Row(
//                     children: [
//                      const  Spacer(),
//                       TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Отмена",style: TextStyle(color: BColor.cancelbutton, fontSize: 15,fontWeight: FontWeight.w500),),),
//                       TextButton(onPressed: (){}, child: Text("Добавить",style: TextStyle(color: BColor.oktbutton,fontSize: 15,fontWeight: FontWeight.w500),))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }
// }