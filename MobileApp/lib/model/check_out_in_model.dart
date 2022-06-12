class CheckOutInModel {
  bool status;
  String message;
  Data data;



  CheckOutInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<MyOrder> myOrder;

  Data({this.myOrder});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['My_order'] != null) {
      myOrder = <MyOrder>[];
      json['My_order'].forEach((v) {
        myOrder.add(new MyOrder.fromJson(v));
      });
    }
  }

}

class MyOrder {
  String id;
  String orderDate;
  bool orderOnline;
  List<OrderContain> orderContain;
  double totalPrice;

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderDate = json['order_date'];
    orderOnline = json['order_online'];

    if (json['order_contain'] != null) {
      orderContain = <OrderContain>[];
      json['order_contain'].forEach((v) {
        orderContain.add(new OrderContain.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

}

class OrderContain {
  String id;
  String dishName;
  String dishPrice;
  String dishDiscription;
  String dishImage;
  String dishUrl;
  bool isActive;
  String dishCategory;
  List<int> favouriteDish;

  OrderContain(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishDiscription,
        this.dishImage,
        this.dishUrl,
        this.isActive,
        this.dishCategory,
        this.favouriteDish});

  OrderContain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishDiscription = json['dish_discription'];
    dishImage = json['dish_image'];
    dishUrl = json['dish_url'];
    isActive = json['is_active'];
    dishCategory = json['dish_category'];
    favouriteDish = json['favourite_dish'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dish_name'] = this.dishName;
    data['dish_price'] = this.dishPrice;
    data['dish_discription'] = this.dishDiscription;
    data['dish_image'] = this.dishImage;
    data['dish_url'] = this.dishUrl;
    data['is_active'] = this.isActive;
    data['dish_category'] = this.dishCategory;
    data['favourite_dish'] = this.favouriteDish;
    return data;
  }
}
