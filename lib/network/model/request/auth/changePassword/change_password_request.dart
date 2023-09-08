class ChangePasswordRequest {
  String? name;
  Param? param;

  ChangePasswordRequest({this.name, this.param});

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
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
  String? newPassword;
  String? confirmPassword;

  Param({this.newPassword, this.confirmPassword});

  Param.fromJson(Map<String, dynamic> json) {
    newPassword = json['new_password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new_password'] = this.newPassword;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
