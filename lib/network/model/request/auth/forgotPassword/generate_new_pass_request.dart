class GenerateNewPassRequest {
  String? name;
  Param? param;

  GenerateNewPassRequest({this.name, this.param});

  GenerateNewPassRequest.fromJson(Map<String, dynamic> json) {
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
  String? password;
  String? userId;

  Param({this.password, this.userId});

  Param.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['user_id'] = this.userId;
    return data;
  }
}
