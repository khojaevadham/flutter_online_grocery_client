import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class Exitdialog extends StatefulWidget {

  const Exitdialog({super.key,});

  @override
  State<Exitdialog> createState() => _ExitdialogState();
}

class _ExitdialogState extends State<Exitdialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
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

                Text('Выход',
                  style: TextStyle(color: TColor.primaryText, fontSize: 20, fontWeight: FontWeight.w700),
                ),   const  SizedBox(height: 10),


                Text(
                  'При выходе из приложении данные для входа и связь с кошельком DC wallet будут удалены.',
                  style: TextStyle(color: TColor.secondaryText, fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const  SizedBox(height: 10),

                Row(
                  children: [
                    const  Spacer(),
                    TextButton(onPressed: (){Navigator.pop(context);},
                      child: Text(
                        "Отмена",
                        style: TextStyle(color: TColor.secondaryText, fontSize: 16,fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextButton(onPressed: (){Navigator.pushNamed(context, "/");},
                        child: Text(
                          "Выйти",
                          style: TextStyle(color: TColor.primaryText,fontSize: 16,fontWeight: FontWeight.w600),
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