class QuoteRequest {
  String? name;
  Param? param;

  QuoteRequest({this.name, this.param});

  QuoteRequest.fromJson(Map<String, dynamic> json) {
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
  String? postId;
  String? postUserId;
  String? amount;
  String? message;

  Param({this.postId, this.postUserId, this.amount, this.message});

  Param.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postUserId = json['post_user_id'];
    amount = json['amount'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['post_user_id'] = this.postUserId;
    data['amount'] = this.amount;
    data['message'] = this.message;
    return data;
  }
}
