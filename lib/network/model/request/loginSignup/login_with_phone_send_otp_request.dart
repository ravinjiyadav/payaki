class LoginWithPhoneSendOtpRequest {
  String? name;
  Param? param;

  LoginWithPhoneSendOtpRequest({this.name, this.param});

  LoginWithPhoneSendOtpRequest.fromJson(Map<String, dynamic> json) {
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
  String? deviceToken;
  String? deviceType;

  Param({this.countryCode, this.phone, this.deviceToken, this.deviceType});

  Param.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    phone = json['phone'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    return data;
  }
}