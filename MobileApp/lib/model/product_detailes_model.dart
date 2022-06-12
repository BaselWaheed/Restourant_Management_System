class ProductDetailsModel {
  bool status;
  Data data;

  ProductDetailsModel({this.status, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String dishName;
  String dishPrice;
  String dishImage;
  String dishDiscription;
  String dishCategory;
  bool isFavourite;
  bool inCart;

  Data(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishImage,
        this.dishDiscription,
        this.dishCategory,
        this.isFavourite,
        this.inCart});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
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
    data['dish_discription'] = this.dishDiscription;
    data['dish_category'] = this.dishCategory;
    data['is_favourite'] = this.isFavourite;
    data['in_cart'] = this.inCart;
    return data;
  }
}