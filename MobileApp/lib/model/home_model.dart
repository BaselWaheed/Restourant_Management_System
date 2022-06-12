// class HomeModel {
//   bool status;
//   String messege;
//   Data data;
//
//   HomeModel({this.status, this.messege, this.data});
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     messege = json['messege'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['messege'] = this.messege;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<Product> product;
//
//   Data({this.product});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['product'] != null) {
//       product = <Product>[];
//       json['product'].forEach((v) {
//         product.add(new Product.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.product != null) {
//       data['product'] = this.product.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Product {
//   String id;
//   String dishName;
//   String dishPrice;
//   String dishImage;
//   String dishUrl;
//   String dishDiscription;
//   String dishCategory;
//   bool isFavourite;
//   bool inCart;
//
//   Product(
//       {this.id,
//         this.dishName,
//         this.dishPrice,
//         this.dishImage,
//         this.dishUrl,
//         this.dishDiscription,
//         this.dishCategory,
//         this.isFavourite,
//         this.inCart});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     dishName = json['dish_name'];
//     dishPrice = json['dish_price'];
//     dishImage = json['dish_image'];
//     dishUrl = json['dish_url'];
//     dishDiscription = json['dish_discription'];
//     dishCategory = json['dish_category'];
//     isFavourite = json['is_favourite'];
//     inCart = json['in_cart'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['dish_name'] = this.dishName;
//     data['dish_price'] = this.dishPrice;
//     data['dish_image'] = this.dishImage;
//     data['dish_url'] = this.dishUrl;
//     data['dish_discription'] = this.dishDiscription;
//     data['dish_category'] = this.dishCategory;
//     data['is_favourite'] = this.isFavourite;
//     data['in_cart'] = this.inCart;
//     return data;
//   }
// }
class HomeAndCategoryModel {
  bool status;
  String message;
  Data data;

  HomeAndCategoryModel({this.status, this.message, this.data});

  HomeAndCategoryModel.fromJson(Map<String, dynamic> json) {
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
  List<Homepage> homepage;
  List<Category> category;

  Data({this.homepage, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['homepage'] != null) {
      homepage = <Homepage>[];
      json['homepage'].forEach((v) {
        homepage.add(new Homepage.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homepage != null) {
      data['homepage'] = this.homepage.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Homepage {
  String id;
  String dishName;
  String dishPrice;
  String dishImage;
  String dishUrl;
  String dishDiscription;
  String dishCategory;
  bool isActive;
  bool isFavourite;
  bool inCart;

  Homepage(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishImage,
        this.dishUrl,
        this.dishDiscription,
        this.dishCategory,
        this.isActive,
        this.isFavourite,
        this.inCart});

  Homepage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishName = json['dish_name'];
    dishPrice = json['dish_price'];
    dishImage = json['dish_image'];
    dishUrl = json['dish_url'];
    dishDiscription = json['dish_discription'];
    dishCategory = json['dish_category'];
    isActive = json['is_active'];
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
    data['is_active'] = this.isActive;
    data['is_favourite'] = this.isFavourite;
    data['in_cart'] = this.inCart;
    return data;
  }
}

class Category {
  String catName;
  Products products;

  Category({this.catName, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    catName = json['cat_name'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_name'] = this.catName;
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    return data;
  }
}

class Products {
  List<ProductCat> product;

  Products({this.product});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductCat>[];
      json['product'].forEach((v) {
        product.add(new ProductCat.fromJson(v));
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

class ProductCat {
  String id;
  String dishName;
  String dishPrice;
  String dishImage;
  String dishUrl;
  String dishDiscription;
  String dishCategory;
  bool isFavourite;
  bool inCart;

  ProductCat(
      {this.id,
        this.dishName,
        this.dishPrice,
        this.dishImage,
        this.dishUrl,
        this.dishDiscription,
        this.dishCategory,
        this.isFavourite,
        this.inCart});

  ProductCat.fromJson(Map<String, dynamic> json) {
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