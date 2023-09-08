class LoginWithPhoneVerifyOtpRequest {
  String? name;
  Param? param;

  LoginWithPhoneVerifyOtpRequest({this.name, this.param});

  LoginWithPhoneVerifyOtpRequest.fromJson(Map<String, dynamic> json) {
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
  String? countryCode;
  String? phone;
  String? otp;

  Param({this.countryCode, this.phone, this.otp});

  Param.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    phone = json['phone'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    return data;
  }
}
