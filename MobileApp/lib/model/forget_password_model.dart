class ForgetPasswordModel {
  bool status;
  String messege;

  ForgetPasswordModel({this.status, this.messege});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['messege'] = this.messege;
    return data;
  }
}
