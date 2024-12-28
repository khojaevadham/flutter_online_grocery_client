import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/color_extension.dart';
import '../../../common_widget/location_row.dart';
import '../../../same_widgets/round_button.dart';
import '../../../view_model/address_view_model.dart';
import 'add_addres_dialog.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String selectedAddress = '';
  final AddressViewModel addressVB = Get.find();

  @override
  void initState() {
    super.initState();
    addressVB.loadSelectedAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BColor.background,
        iconTheme: const IconThemeData(size: 30),
        title: Text(
          "Мои адреса",
          style: TextStyle(
            color: TColor.text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/background_images/back_dc.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Obx(
              () => Column(
                children: [
                  if (addressVB.listArr.isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(
                          "У вас нет ни одного адреса",
                          style: TextStyle(
                            color: TColor.text,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: addressVB.listArr.length,
                      itemBuilder: (context, index) {
                        final aObj = addressVB.listArr[index];
                        return Obx(()=>
                            LocationRow(
                              aObj: aObj,
                              selectedAddress: addressVB.selectedAddress1.value,
                              onpressed: () {
                                print(selectedAddress + "${aObj.address}");
                                addressVB.saveSelectedAddress(aObj.address ?? "");
                              },
                            ),
                        );

                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: RoundButton(
                    title: "Добавить новый адрес",
                    onPressed: () {
                      _showAddAddressDialog(context);
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AddAddressDialog();
      },
    );
  }
}



