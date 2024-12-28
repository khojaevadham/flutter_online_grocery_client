import 'package:dcgrocer/common_widget/deliver_address_dialog_row.dart';
import 'package:dcgrocer/view_model/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/color_extension.dart';


class DeliverAddres extends StatefulWidget {  

  
  const DeliverAddres({super.key,});

  @override
  State<DeliverAddres> createState() => _DeliverAddresState();
}

class _DeliverAddresState extends State<DeliverAddres> {

  final AddressViewModel addressVM =  Get.find();
  int _selectindex = -1;


  @override
  void initState() {
    super.initState();
    _initializeSelectedAddress();
  }

  Future<void> _initializeSelectedAddress() async {
    await addressVM.loadSelectedAddress();
    String savedAddress = addressVM.selectedAddress1.value;

    setState(() {
      _selectindex = addressVM.listArr.indexWhere((address) => address.address == savedAddress);
    });
  }

  void _onselectAddress(int index) {
    setState(() {
      _selectindex = index;
    });

    String selectedAddress = addressVM.listArr[index].address ?? "";
    addressVM.saveSelectedAddress(selectedAddress);
  }

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
                  
                   Text( 'Адрес доставки',
                    style: TextStyle(color: TColor.text, fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                 Obx( ()=>
                  addressVM.selectedAddress1.isNotEmpty ?
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: addressVM.listArr.length,
                      itemBuilder: (context, index){
                        var address = addressVM.listArr[index];
                        return DeliverAddressDialogRow(
                          address: address,
                          isSelected: _selectindex == index,
                          onSelected: () => _onselectAddress(index),
                        );
                      }
                  ) :
                     Padding(
                       padding: const EdgeInsets.all(10),
                       child: Center(
                         child: Text(
                           'У вас нет выбранный адрес',
                           style: TextStyle(
                               color: TColor.text,
                               fontSize: 18,
                               fontWeight: FontWeight.w600),
                         ),
                       ),
                     )

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
                            addressVM.selectedAddress1.isNotEmpty?
                            Navigator.pushNamed(context, 'order_view')
                                : Get.snackbar('Необходимо выбрать адрес', '');
                          },
                          child: Text(
                            "Применить",
                            style: TextStyle(
                                color: TColor.primaryText,
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