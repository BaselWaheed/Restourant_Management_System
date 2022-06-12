class SendReview {
  bool status;
  String massege;

  SendReview({this.status, this.massege});

  SendReview.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massege = json['massege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massege'] = this.massege;
    return data;
  }
}
