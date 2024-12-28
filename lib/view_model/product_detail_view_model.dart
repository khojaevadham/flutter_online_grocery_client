
import 'package:get/get.dart';

import '../model/offer_product_model.dart';

class ProductDetailViewModel  extends GetxController{

  final OfferProductModel pObj;
  final   isFav = false.obs;
  final   qty = 1.obs;


  ProductDetailViewModel(this.pObj);


  void addSubQTY({isAdd = true} ) {
    if(isAdd) {
      qty.value = qty.value + 1;

      if(qty.value > 99) {
        qty.value = 99;
      }
    }else{
      qty.value = qty.value - 1;

      if(qty.value < 1) {
        qty.value = 1;
      }
    }
  }

}