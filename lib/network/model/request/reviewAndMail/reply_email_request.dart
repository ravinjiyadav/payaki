class ReplyEmailRequest {
  String? name;
  Param? param;

  ReplyEmailRequest({this.name, this.param});

  ReplyEmailRequest.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? phone;
  String? message;
  String? toEmail;
  String? receiverName;
  String? productId;
  String? productName;

  Param(
      {this.name,
        this.email,
        this.phone,
        this.message,
        this.toEmail,
        this.receiverName,
        this.productId,
        this.productName});

  Param.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    message = json['message'];
    toEmail = json['toEmail'];
    receiverName = json['receiverName'];
    productId = json['productId'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['message'] = this.message;
    data['toEmail'] = this.toEmail;
    data['receiverName'] = this.receiverName;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    return data;
  }
}
