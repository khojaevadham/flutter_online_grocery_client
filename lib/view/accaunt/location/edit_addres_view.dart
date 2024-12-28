import 'package:dcgrocer/model/address_item_model.dart';
import 'package:dcgrocer/view_model/address_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/color_extension.dart';

class EditAddresView extends StatefulWidget {

  final AddressItemModel aObj;

  EditAddresView({
    required this.aObj
});

  @override
  _EditAddresViewState createState() => _EditAddresViewState();
}

  class _EditAddresViewState extends State<EditAddresView> {
    late TextEditingController _locationController;
    late TextEditingController _addressController;

    final AddressViewModel addressController = Get.find();

    @override
    void initState() {
      super.initState();
      _locationController = TextEditingController(text: widget.aObj.location);
      _addressController = TextEditingController(text: widget.aObj.address);
    }

    @override
    void dispose() {
      _locationController.dispose();
      _addressController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Изменить адрес',
                style: TextStyle(color: TColor.primaryText, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                'Введите наименование локации и адрес доставки',
                style: TextStyle(color: TColor.secondaryText, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(hintText: "Локация"),
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(hintText: "Адрес"),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: _deleteAddress,
                    child: const Text(
                      "Удалить",
                      style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Отмена",
                      style: TextStyle(color: TColor.secondaryText, fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                    onPressed: _updateAddress,
                    child: Text(
                      "Сохранить",
                      style: TextStyle(color: TColor.blue_text, fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    void _deleteAddress() {
      addressController.deleteAddress(widget.aObj);
      Navigator.pop(context);
      Get.snackbar('Адрес успешно удален', '${widget.aObj.location}, ${widget.aObj.address}');
    }

    void _updateAddress() {
      final updatedAddress = AddressItemModel(
        location: _locationController.text,
        address: _addressController.text,
      );

      addressController.updateAddress(widget.aObj, updatedAddress);
      Navigator.pop(context);
      Get.snackbar('Адрес успешно изменен', '${updatedAddress.location}, ${updatedAddress.address}');
    }
  }

