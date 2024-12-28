import 'package:dcgrocer/model/address_item_model.dart';
import 'package:dcgrocer/view_model/address_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/color_extension.dart';

class AddAddressDialog extends StatefulWidget {


  AddAddressDialog();

  @override
  _AddAddressDialogState createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {

  final _locationController = TextEditingController();
  final _addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final AddressViewModel addressController = Get.find();

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

                Text(
            'Добавление нового адреса',
                  style: TextStyle(color: TColor.primaryText, fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const  SizedBox(height: 10),

                Text(
                  'Введите наименование локации и адрес доставки',
                  style: TextStyle(color: TColor.secondaryText,
                      fontWeight: FontWeight.w500),
                ),
                // const SizedBox(height: 10),

                TextField(
                  controller: _locationController,
                  style: TextStyle( color: TColor.primaryText,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                  ),
                ),
                TextField(
                  controller: _addressController,
                  style: TextStyle( color: TColor.primaryText,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextButton(
                      onPressed: (){Navigator.pop(context);},
                      child: Text(
                        "Отмена",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),),
                    ),

                    TextButton(
                        onPressed: (){
                           final item = AddressItemModel(
                               location: _locationController.text,
                               address: _addressController.text,
                           );

                           addressController.addAddress(item);
                           Navigator.pop(context);
                           Get.snackbar('Адрес добавлен' , '${_locationController.text} ${_addressController.text}');

                          print(" ${_locationController.text}  ${_addressController.text}");
                        },
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
