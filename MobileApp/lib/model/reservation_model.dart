class ReservationModel {
  bool status;
  String massege;
  Data data;

  ReservationModel({this.status, this.massege, this.data});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massege = json['massege'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massege'] = this.massege;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String resDate;
  int resTableCount;
  int resGuestCount;
  String resTime;

  Data({this.resDate, this.resTableCount, this.resGuestCount, this.resTime});

  Data.fromJson(Map<String, dynamic> json) {
    resDate = json['res_date'];
    resTableCount = json['res_table_count'];
    resGuestCount = json['res_guest_count'];
    resTime = json['res_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['res_date'] = this.resDate;
    data['res_table_count'] = this.resTableCount;
    data['res_guest_count'] = this.resGuestCount;
    data['res_time'] = this.resTime;
    return data;
  }
}