class ForgotPassVerifyOtpRequest {
  String? name;
  Param? param;

  ForgotPassVerifyOtpRequest({this.name, this.param});

  ForgotPassVerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    param = json['param'] != null ? new Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.param != null) {
      data['param'] = this.param!.toJson();
    }
    return data;
  }
}

class Param {
  String? otp;
  String? userId;

  Param({this.otp, this.userId});

  Param.fromJson(Map<String, dynamic> json) {
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
