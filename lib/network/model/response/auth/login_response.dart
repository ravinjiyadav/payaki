class LogInResponse {
  bool? status;
  int? code;
  String? message;
  String? token;
  Data? data;

  LogInResponse({this.status, this.code, this.message, this.token, this.data});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? passwordHash;
  String? email;
  String? name;
  String? username;
  dynamic tagline;
  String? phone;
  String? image;
  String? isEmailVerified;
  String? isPhoneVerified;
  String? chatUrl;

  Data(
      {this.id,
        this.passwordHash,
        this.email,
        this.name,
        this.username,
        this.tagline,
        this.phone,
        this.image,
        this.isEmailVerified,
        this.isPhoneVerified,
        this.chatUrl
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    passwordHash = json['password_hash'];
    email = json['email'];
    name = json['name'];
    username = json['username'];
    tagline = json['tagline'];
    phone = json['phone'];
    image = json['image'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneVerified = json['isPhoneVerified'];
    chatUrl = json['chat_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password_hash'] = this.passwordHash;
    data['email'] = this.email;
    data['name'] = this.name;
    data['username'] = this.username;
    data['tagline'] = this.tagline;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isPhoneVerified'] = this.isPhoneVerified;
    data['chat_url'] = this.chatUrl;
    return data;
  }
}
