class LoginModel {
  LoginModel({
    this.status,
    this.messege,
    this.data,
  });
  String messege;
  bool status;
  Data data;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    messege=json['messege'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.birthdata,
    this.isMale,
    this.token,
  });
  String firstname;
  String lastname;
  String username;
  String email;
  String birthdata;
  bool isMale;
  String token;

  Data.fromJson(Map<String, dynamic> json){
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    birthdata = json['birthdata'];
    isMale = json['is_male'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['username'] = username;
    _data['email'] = email;
    _data['birthdata'] = birthdata;
    _data['is_male'] = isMale;
    _data['token'] = token;
    return _data;
  }
}