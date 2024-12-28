import 'package:dcgrocer/common_widget/filter_row.dart';
import 'package:dcgrocer/same_widgets/round_button.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {

  List selectArr = [];

   List filterCatArr = [
    {
      "id" : "1",
      "name" : "Яйцо"
    },
     {
      "id" : "2",
      "name" : "Паста"
    },
     {
      "id" : "3",
      "name" : "Фаст Фуд"
    },
     {
      "id" : "4",
      "name" : "Чипсы"
    },
  ];


   List filterBrandArr = [
    {
      "id" : "1",
      "name" : "Индивидуал коллекция"
    },
     {
      "id" : "2",
      "name" : "CocaCola"
    },
     {
      "id" : "3",
      "name" : "Pepsi"
    },
     {
      "id" : "4",
      "name" : "Dobriy"
    },
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      backgroundColor: Colors.white,             
      appBar: 
      AppBar(        
        elevation: 0.5,
        backgroundColor: Colors.white,      
        centerTitle: true,
        // leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:  Image.asset("assets/img/back.png", height: 20,width: 20,)),
        leading:  IconButton(
          onPressed: (){Navigator.pop(context);}, 
          icon:  Image.asset("assets/img/back_andr.png",
           height: 20,
           width: 20,)),
        title: Text(
             "Фильтр",
            style: TextStyle(
              color: TColor.primaryText, fontSize: 20, fontWeight: FontWeight.w700),
                 ),       
      ),
      body: Container(
        padding: const  EdgeInsets.all(20),
         decoration: const BoxDecoration(
              // color: const Color(0xffF2F3F2), 
              color: Color.fromARGB(255, 231, 231, 231), 
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),  
            ),    
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                                   "Категории",
                                  style: TextStyle(
                                    color: TColor.primaryText, fontSize: 21, fontWeight: FontWeight.w600),
                                       ),
                    ),
                 Column(
                  children: filterCatArr.map((fObj) {
                    return FilterRow(
                      fObj: fObj, 
                      isSelect: selectArr.contains(fObj),
                      onPressed: (){
                        if(selectArr.contains(fObj)){
                          selectArr.remove(fObj);                          
                        }else{
                          selectArr.add(fObj);
                        }
                        setState(() {
                          
                        });
                    });
                  }).toList()
                  ),
              
                 Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                                   "Брэнд",
                                  style: TextStyle(
                                    color: TColor.primaryText, fontSize: 21, fontWeight: FontWeight.w600),
                                       ),
                    ),
         
                 Column(
                  children: filterBrandArr.map((fObj) {
                    return FilterRow(
                      fObj: fObj, 
                      isSelect: selectArr.contains(fObj),
                      onPressed: (){
                        if(selectArr.contains(fObj)){
                          selectArr.remove(fObj);                          
                        }else{
                          selectArr.add(fObj);
                        }
                        setState(() {
                          
                        });
                    });
                  }).toList()
                  ),
                ],
              ),
             )
            ),

          RoundButton(title: 'Применить фильтр', onPressed: (){})
          
          ],
        ),
      ),
    );
  }
}