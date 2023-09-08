class SocialLoginRequest {
  String? name;
  Param? param;

  SocialLoginRequest({this.name, this.param});

  SocialLoginRequest.fromJson(Map<String, dynamic> json) {
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
  String? oauthProvider;
  String? oauthUid;
  String? email;
  String? deviceToken;
  String? deviceType;

  Param(
      {this.oauthProvider,
        this.oauthUid,
        this.email,
        this.deviceToken,
        this.deviceType});

  Param.fromJson(Map<String, dynamic> json) {
    oauthProvider = json['oauth_provider'];
    oauthUid = json['oauth_uid'];
    email = json['email'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oauth_provider'] = this.oauthProvider;
    data['oauth_uid'] = this.oauthUid;
    data['email'] = this.email;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    return data;
  }
}