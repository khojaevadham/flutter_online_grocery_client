import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import '../common/color_extension.dart';

class PaymentRow extends StatelessWidget {

  final String ID;
  final String icon;
  final String title;
  final String subtitle;
  final String ball;
  final String selectID;
  final VoidCallback onPressed;

const  PaymentRow({
  super.key,
  required this.ID,
  required this.icon,
  required this.title,
  required this.subtitle,
  required this.onPressed,
  required  this.ball,
  required this.selectID,
});



  @override
  Widget build(BuildContext context) {

    bool isSelected = ID == selectID;


    return  Column(
      children: [
        const  Padding(padding:  EdgeInsets.symmetric(vertical: 5,),),
      InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration:  BoxDecoration(
              color: isSelected ?  BColor.onpress : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isSelected ? BColor.border_onpress : BColor.white_cont,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: 65, height: 80 ,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 13,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        title,
                        style:  TextStyle(
                        color: TColor.primaryText, fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            child: Text(
                              subtitle,
                              style:  TextStyle(
                                  color: TColor.secondaryText, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            fit: BoxFit.contain,
                          ),

                          SizedBox(width: 30,),

                          if(isSelected == true)
                            Image.asset(
                              "assets/img/icons/select_location.png" ,
                              width: 25,
                              height: 25,
                              // color: isSelected ? Colors.blue : TColor.secondaryText,
                            ),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),

                        height: 20,
                        decoration: BoxDecoration(
                          color: BColor.ball_cont ,
                        borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                        textAlign:  TextAlign.center,
                          ball,
                        style: const TextStyle(color: Colors.white, fontSize: 12),),
                      )
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