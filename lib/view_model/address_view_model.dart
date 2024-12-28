import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/address_item_model.dart';

  class AddressViewModel extends GetxController{

    final RxList<AddressItemModel> listArr = <AddressItemModel>[].obs;
    Rx<AddressItemModel?> selectedAddress = Rx<AddressItemModel?>(null);
    Rx<String> selectedAddress1 = ''.obs;

    void addAddress(AddressItemModel item) {
      var exItem = listArr.firstWhereOrNull((i) =>
      i.location == item.location && i.address == item.address);
      if (exItem == null) {
        listArr.add(item);
      }
    }


    void deleteAddress(AddressItemModel item) {
      listArr.removeWhere((i) =>
      i.location == item.location && i.address == item.address);
    }


    void updateAddress(AddressItemModel oldItem, AddressItemModel newItem) {
      int index = listArr.indexWhere( (i) =>
      i.address == oldItem.address && i.location == oldItem.location);

      if (index!= -1) {
        listArr[index] = newItem;
      }
    }

    void setSelectedAddress(AddressItemModel address) {
      selectedAddress.value = address;
      update();
    }

    Future<void> saveSelectedAddress(String address) async {
      selectedAddress1.value = address;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedAddress1', address);
    }

    Future<void> loadSelectedAddress() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      selectedAddress1.value = prefs.getString('selectedAddress1') ?? '';
    }

  }