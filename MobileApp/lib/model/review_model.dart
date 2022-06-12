class ReviewModel {
  bool status;
  String message;
  Data data;

  ReviewModel({this.status, this.message, this.data});

  ReviewModel.fromJson(Map<String, dynamic> json) {
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
  List<InfoModel> info;

  Data({this.info});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = <InfoModel>[];
      json['info'].forEach((v) {
        info.add(new InfoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InfoModel {
  String user;
  bool isMale;
  String comment;

  InfoModel({this.user, this.isMale, this.comment});

  InfoModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    isMale = json['is_male'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['is_male'] = this.isMale;
    data['comment'] = this.comment;
    return data;
  }
}
