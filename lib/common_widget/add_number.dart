import 'package:flutter/material.dart';

import '../common/color_extension.dart';
class AddNumber extends StatefulWidget {

  const AddNumber({super.key,});

  @override
  State<AddNumber> createState() => _AddNumberState();
}

class  _AddNumberState extends State<AddNumber> {

  String hintText = '+992 888 777 788';

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text( 'Добавление номера',
                  style: TextStyle(color: TColor.primaryText, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const  SizedBox(height: 10),

                Text(
                  'Укажите  дополнительный номер телефона ',
                  style: TextStyle(color: TColor.secondaryText, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),

                TextField(
                  style: TextStyle( color: TColor.primaryText, fontWeight: FontWeight.w500),
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: TColor.secondaryText, fontWeight: FontWeight.w500),
                      // border: UnderlineInputBorder(
                      //   borderRadius: BorderRadius.circular(0),
                      //   borderSide: BorderSide(color: )
                      // )

                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const  Spacer(),
                    TextButton(
                      onPressed: (){Navigator.pop(context);},
                      child: Text(
                        "Отмена",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),),),
                    TextButton(
                        onPressed: (){},
                        child:  Text(
                          "Добавить",
                          style: TextStyle(
                              color: TColor.blue_text,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
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
