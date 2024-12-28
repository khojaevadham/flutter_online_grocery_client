import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ChatHistoryRow extends StatelessWidget {

  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const ChatHistoryRow({super.key, required this.icon, required this.title, required this.subtitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Column(      
      children: [
        const  Padding(padding: const EdgeInsets.symmetric(vertical: 5,),),
      InkWell(          
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration:  BoxDecoration(
              color: Colors.white,
              // boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 5)],
              border: Border.all(color: BColor.white_cont, width: 1 ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(icon,
                    width: 60,
                    height: 60 ,
                    fit: BoxFit.contain, ),

                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:  TextStyle(
                        color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    const SizedBox(
                        height: 4,
                      ),
                      Text(
                        subtitle,
                        style:  TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ),
        )
      ],
    );
  }
}