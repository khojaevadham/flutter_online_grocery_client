
import 'package:get/get.dart';

class OfferProductModel{
  String? icon;
  String? name;
  String? unit;
  String? description;
  double? price;
  RxBool isFav;

  OfferProductModel({
    bool? isFav,
    this.icon,
    this.name,
    this.description,
    this.price,
    this.unit,
  }) : isFav = (isFav ?? false).obs;


  OfferProductModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        name = json['name'],
        description = json['description'],
        unit = json['unit'],
        price = double.tryParse(json['price'].toString()) ?? 0.0,
        isFav = false.obs;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['icon'] = icon;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['unit'] = unit;
    return data;
  }
}