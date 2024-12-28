
import 'package:get/get.dart';

import '../model/cart_item_model.dart';

  class CartViewModel  extends  GetxController{

    final RxList<CartItemModel> listArr = <CartItemModel>[].obs;

    void addToCart(CartItemModel item) {
      var existingItem = listArr.firstWhereOrNull((i) => i.name == item.name);
      if (existingItem != null) {
        existingItem.qty++;
        existingItem.totalPrice = existingItem.price! * existingItem.qty;
      } else {
        listArr.add(item);
      }
    }

    void removeFromCart(int index) {
      listArr.removeAt(index);
    }

    double get totalPrice {
      return listArr.fold(0, (sum, item) => sum + (item.price! * item.qty));
    }

    int get totalItem {
       return listArr.fold(0, (sum, item) => sum + item.qty);
    }

    void clearCart() {
      listArr.clear();
    }
  }