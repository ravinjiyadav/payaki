class ForgotPassSendOtpRequest {
  String? name;
  Param? param;

  ForgotPassSendOtpRequest({this.name, this.param});

  ForgotPassSendOtpRequest.fromJson(Map<String, dynamic> json) {
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
  String? mobile;
  String? countryCode;

  Param({this.mobile, this.countryCode});

  Param.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['country_code'] = this.countryCode;
    return data;
  }
}
