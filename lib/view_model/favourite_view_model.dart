

import 'package:dcgrocer/model/offer_product_model.dart';
import 'package:get/get.dart';

class FavouriteViewModel extends GetxController{

  RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;


    void  serviceCallAddRemoveFavorite(int index){
      listArr.removeAt(index);
    }
 }