class FavoritesModel {
  bool status;
  String message;
  Data data;

  FavoritesModel({this.status, this.message, this.data});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Product> product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String id;
  String dishName;
  String dishPrice;
  String dishImage;
  String dishUrl;
  String dishDiscription;
  String dishCategory;
  bool isFavourite;
  bool inCart;

  Product(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishImage,
        this.dishUrl,
        this.dishDiscription,
        this.dishCategory,
        this.isFavourite,
        this.inCart});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishUrl = json['dish_url'];
    dishDiscription = json['dish_discription'];
    dishCategory = json['dish_category'];
    isFavourite = json['is_favourite'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dish_name'] = this.dishName;
    data['dish_price'] = this.dishPrice;
    data['dish_image'] = this.dishImage;
    data['dish_url'] = this.dishUrl;
    data['dish_discription'] = this.dishDiscription;
    data['dish_category'] = this.dishCategory;
    data['is_favourite'] = this.isFavourite;
    data['in_cart'] = this.inCart;
    return data;
  }
}