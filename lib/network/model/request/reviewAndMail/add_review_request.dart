class AddReviewRequest {
  String? name;
  Param? param;

  AddReviewRequest({this.name, this.param});

  AddReviewRequest.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? productId;
  String? rating;
  String? comment;

  Param({this.userId, this.productId, this.rating, this.comment});

  Param.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}
