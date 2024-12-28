import 'package:dcgrocer/model/address_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/color_extension.dart';
import '../view_model/address_view_model.dart';

class DeliverAddressDialogRow extends StatefulWidget {
  final AddressItemModel address;
  final bool isSelected;
  final VoidCallback onSelected;


   DeliverAddressDialogRow({
    super.key,
    required this.address,
      required this.isSelected,
      required this.onSelected,
  });

  @override
  State<DeliverAddressDialogRow> createState() => _DeliverAddressDialogRowState();
}

class _DeliverAddressDialogRowState extends State<DeliverAddressDialogRow> {

  final AddressViewModel addressVM = Get.find();

  void onchooseaddress(AddressItemModel item) {
    addressVM.setSelectedAddress(item);
    print("Выбран адрес: ${item.location}, ${item.address}");
    // Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Row(
          children: [
            Text(
             widget.address.location ?? "",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: TColor.primaryText),
                 ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  widget.onSelected();
                  onchooseaddress(widget.address);
                  },
                icon:
                Icon(
                  widget.isSelected ?
                  Icons.radio_button_checked_outlined :
                  Icons.radio_button_off_outlined,
                  size: 20,
                  color: widget.isSelected  ?  BColor.buttoncolor : Colors.black,
                )
            ),
          ],
        ),

          const Divider(color: Colors.grey, height: 1,),

      ],
    );
  }
}
