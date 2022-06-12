class UserModel {
  bool status;
  String message;
  User user;

  UserModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    user = User.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.phone,
    this.address,
    this.birthdate,
    this.is_male,
    this.token,
  });
  String firstname;
  String lastname;
  String username;
  String email;
  String phone;
  String address;
  String birthdate;
  bool is_male;
  String token;

  User.fromJson(Map<String, dynamic> json){
    firstname = json['first_name'];
    lastname = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    birthdate = json['birthdate'];
    is_male = json['is_male'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstname;
    _data['last_name'] = lastname;
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['birthdate'] = birthdate;
    _data['is_male'] = is_male;
    _data['token'] = token;
    return _data;
  }
}