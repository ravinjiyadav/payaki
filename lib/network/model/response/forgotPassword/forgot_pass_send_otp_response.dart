class ForgotPassSendOtpResponse {
  bool? status;
  int? code;
  String? message;
  Data? data;

  ForgotPassSendOtpResponse({this.status, this.code, this.message, this.data});

  ForgotPassSendOtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? otp;
  String? userId;

  Data({this.otp, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['user_id'] = this.userId;
    return data;
  }
}
