class LogInRequest {
  String? name;
  Param? param;

  LogInRequest({this.name, this.param});

  LogInRequest.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? pass;
  String? deviceToken;
  String? deviceType;

  Param({this.email, this.pass, this.deviceToken, this.deviceType});

  Param.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    pass = json['pass'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['pass'] = this.pass;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    return data;
  }
}
