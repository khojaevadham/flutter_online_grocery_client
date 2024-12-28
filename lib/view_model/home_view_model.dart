
  import 'package:dcgrocer/model/offer_product_model.dart';
  import 'package:get/get.dart';

  class HomeViewModel  extends GetxController{

    List<Map<String, String>> product_water = [
      {
        "icon" : "assets/img/products/dbr_2.png",
        "name" : "Сок Добрый",
        "unit" : "2л",
        "description" : "Яблоко",
        "price" :  "41",
      },
      {
        "icon" : "assets/img/products/dbry_1.png",
        "name" : "Сок Добрый",
        "unit" : "1л",
        "description" : "Апельсин",
        "price" :  "21",
      },
      {
        "icon" : "assets/img/products/pep_1.5.png",
        "name" : "Пепси",
        "unit" : "1.5л",
        "description" : "манго",
        "price" :  "12",
      },
      {
        "icon" : "assets/img/products/pep_1.png",
        "name" : "Пепси",
        "unit" : "1л",
        "description" : "манго",
        "price" :  "8",
      },
      {
        "icon" : "assets/img/products/pep_0.5.png",
        "name" : "Пепси",
        "unit" : "0.5л",
        "description" : "манго",
        "price" :  "5",
      },
      {
        "icon" : "assets/img/products/app_makin.png",
        "name" : "Яблоко Макинтош",
        "unit" : "1 кг",
        "description" : "красный",
        "price" :  "29",
      },
      {
        "icon" : "assets/img/products/apple_green.png",
        "name" : "Яблоко",
        "unit" : "1 кг",
        "description" : "",
        "price" :  "20",
      }
    ];


    final RxList<OfferProductModel> offerArr = <OfferProductModel>[].obs;
    final RxList<OfferProductModel> favArr  = <OfferProductModel>[].obs;

    void serviceCallHome() {
      if (offerArr.isEmpty) {
        offerArr.addAll(product_water.map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }));
      }      print("Количество элементов в offerArr: ${offerArr.length}");
    }

    void callserverAddRemoveFavorite(OfferProductModel product) {
      product.isFav.value = !product.isFav.value;

      if (product.isFav.value) {
        favArr.add(product);
      } else {
        favArr.remove(product);
      }

      Get.snackbar(
        product.isFav.value ? 'Добавлено в избранное' : 'Удалено из избранного',
        product.name ?? '',
      );
    }


  }