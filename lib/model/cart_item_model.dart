
class CartItemModel {
     String? name;
     String? image;
     String? description;
     double? price;
     double? totalPrice;
     int qty;

    CartItemModel({
      required this.name,
      required this.price,
      required this.image,
      required this.description,
      this.totalPrice,
      this.qty = 1
    });

  }
