import 'package:flutter/material.dart';

import '../../../common_widget/chat_history_row.dart';
import '../../../common/color_extension.dart';

class ChatHistory extends StatefulWidget {
  const ChatHistory({super.key});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {

  List  chatlist = [
      {        
        "icon":  "assets/img/logotips/dcchat.png",
        "title": "Экспресс",
        "subtitle" :  "улица Рудаки 25/1",        
      },
     {        
        "icon":  "assets/img/logotips/ashan.png",
        "title": "Ашан",
        "subtitle" :  "улица Кахрамонхо 13",        
      },
     {        
        "icon":  "assets/img/logotips/dcchat.png",
        "title": "Экспресс",
        "subtitle" :  "улица Кахрамонхо 13",        
      },
      {        
        "icon":  "assets/img/logotips/paykar.png",
        "title": "Пайкар",
        "subtitle" :  "улица Рудаки 25/1",        
      },
       {        
        "icon":  "assets/img/logotips/dcchat.png",
        "title": "Экспресс",
        "subtitle" :  "улица Рудаки 25/1",        
      },
     {        
        "icon":  "assets/img/logotips/ashan.png",
        "title": "Ашан",
        "subtitle" :  "улица Кахрамонхо 13",        
      },
      ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar( 
        backgroundColor:  Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        // elevation: 0.5,
        // leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon:  Image.asset("assets/img/back.png", height: 20,width: 20,)),
        leading:  IconButton(
          onPressed: (){Navigator.pop(context);}, 
          icon:  Image.asset(
            "assets/img/back_andr.png",
            height: 20,width: 20,)
        ),
        title: Text(
          "История чата", 
          style: TextStyle(
              color: TColor.text,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,        
      ),
      body: Container(
        padding: const  EdgeInsets.all(10),        
        // margin: EdgeInsets.only(left: 10,right: 10),
        decoration: const BoxDecoration(
          image:  DecorationImage(
              image: AssetImage("assets/img/background_images/back_dc.png"),
              fit: BoxFit.cover)
        ),
        child: ListView.builder(
          itemCount: chatlist.length,
          itemBuilder: (context, index) {
            return ChatHistoryRow(
              icon: chatlist[index]["icon"],
              title: chatlist[index]["title"],
              subtitle: chatlist[index]["subtitle"],
              onPressed: () {},
            );
          },
        )
      ),
    );
  }
}