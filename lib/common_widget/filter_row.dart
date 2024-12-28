import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class FilterRow extends StatelessWidget {
  final Map fObj;
  final bool  isSelect;
  final VoidCallback onPressed;
  const FilterRow({super.key, required   this.fObj, required  this.isSelect, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:  onPressed,
      child: Container(
                        padding:  const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            isSelect ?  Icon( Icons.check_box_rounded,
                            color: BColor.buttoncolor,size: 25,)
                            : 
                            const Icon(  Icons.check_box_outline_blank_rounded,
                            // Image.asset("assets/img/checkbox.png",
                            // width: 25,height: 25,
                            color: Colors.grey,size: 25,
                            ),

                          const  SizedBox(width: 15,),
                            Expanded(child: 
                            Text(
                              fObj["name"]
                            ,style:TextStyle(
                              color: isSelect ?  BColor.buttoncolor : TColor.primaryText ,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                             ),
                            )
                          ],
                        ),
                      ),
    );
  }
}