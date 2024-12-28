import 'package:dcgrocer/model/address_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/color_extension.dart';
import '../view/accaunt/location/edit_addres_view.dart';

class LocationRow extends StatelessWidget {
  final AddressItemModel aObj;
  final VoidCallback onpressed;
  final String selectedAddress;

  const LocationRow({
    super.key,
    required this.aObj,
    required this.onpressed,
    required this.selectedAddress,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = aObj.address == selectedAddress;

    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? BColor.onpress : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? BColor.border_onpress : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              isSelected ? 'assets/img/icons/plase_icon.png'
                  : 'assets/img/icons/location_icon.png',
              height: 55,
              width: 55,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aObj.location ?? "",
                  style: TextStyle(
                    fontSize: 14,
                    color: TColor.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  aObj.address ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            isSelected
                ? Image.asset(
              "assets/img/icons/select_location.png",
              width: 25,
              height: 25,
            )
                : InkWell(
                  onTap: () {
                    _showEditAddressDialog(context);
                  },
                  child: SvgPicture.asset(
                    "assets/img/icons/navig_next.svg",
                    width: 18,
                    height: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditAddresView(
          aObj: aObj,
        );
      },
    );
  }
}

