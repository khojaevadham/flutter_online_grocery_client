import 'package:dcgrocer/view/main_tab_view/main_tabview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common/color_extension.dart';

class ChoiceTypeVitrin extends StatefulWidget {
  const ChoiceTypeVitrin({super.key});

  @override
  State<ChoiceTypeVitrin> createState() => _ChoiceTypeVitrinState();
}

class _ChoiceTypeVitrinState extends State<ChoiceTypeVitrin> {

      bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20,top: 20,bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text( 'Выбор витрины ',
                  style: TextStyle(color: TColor.text, fontSize: 18, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 10,),

                Text('Вы можете поменять вид витрины в настройках приложении',
                style: TextStyle(color: TColor.secondaryText, fontSize: 14,fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 10,),


                ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Классический',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: TColor.primaryText),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSelected =!isSelected;
                                  });
                                },
                                icon: Icon(
                                  isSelected ?
                                  Icons.radio_button_checked_outlined :
                                  Icons.radio_button_off_outlined,
                                  size: 20,
                                  color:isSelected  ?  BColor.buttoncolor : Colors.black,
                                )
                            ),
                          ],
                        ),

                        const Divider(color: Colors.grey, height: 1,),

                        Row(
                          children: [
                            Text(
                              'Витринный',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: TColor.primaryText),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSelected =!isSelected;
                                  });
                                },
                                icon: Icon(
                                  isSelected ?
                                  Icons.radio_button_checked_outlined :
                                  Icons.radio_button_off_outlined,
                                  size: 20,
                                  color:isSelected  ?  BColor.buttoncolor : Colors.black,
                                )
                            ),
                          ],
                        ),

                        const Divider(color: Colors.grey, height: 1,),

                      ],
                    )
                  ],
                ),


                Row(
                  children: [
                    const  Spacer(),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);},
                      child: Text(
                        "Отмена",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MainTabview()));
                          },
                        child: Text(
                          "Применить",
                          style: TextStyle(
                              color: TColor.blue_text,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                    )
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
