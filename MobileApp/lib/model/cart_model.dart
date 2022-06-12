class CartModel {
  bool status;
  String message;
  Data data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<CartItem> cartItem;
  double totalPrice;
  double subTotal;
  int delivery;

  Data({this.cartItem, this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart_item'] != null) {
      cartItem = <CartItem>[];
      json['cart_item'].forEach((v) {
        cartItem.add(new CartItem.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    subTotal = json['sub_total'];
    delivery = json['delivery'];
  }


  // int total;
  // Data.fromjson(Map<String, dynamic> json) {
  //   total = json['total_price'];
  // }




}

class CartItem {
  String id;
  String price;
  int quantity;
  Dish dish;

  CartItem({this.id, this.price, this.quantity, this.dish});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    dish = json['dish'] != null ? new Dish.fromJson(json['dish']) : null;
  }

}

class Dish {
  String id;
  String dishName;
  String dishPrice;
  String dishDiscription;
  String dishImage;
  bool isActive;
  String dishCategory;
  List<int> favouriteDish;

  Dish(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishDiscription,
        this.dishImage,
        this.isActive,
        this.dishCategory,
        this.favouriteDish});

  Dish.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishDiscription = json['dish_discription'];
    dishImage = json['dish_image'];
    isActive = json['is_active'];
    dishCategory = json['dish_category'];
    if (json['favourite_dish'] != null) {
      favouriteDish = <int>[];
      json['favourite_dish'].forEach((v) {
        favouriteDish.add((v));
      });
    }
  }

}