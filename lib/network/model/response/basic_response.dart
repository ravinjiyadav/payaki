class BasicResponse {
  bool? status;
  int? code;
  String? message;

  BasicResponse({this.status, this.code, this.message});

  BasicResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}
