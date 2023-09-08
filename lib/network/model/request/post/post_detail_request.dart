class PostDetailRequest {
  String? name;
  Param? param;

  PostDetailRequest({this.name, this.param});

  PostDetailRequest.fromJson(Map<String, dynamic> json) {
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
  String? userId;

  Param({required this.postId,this.userId});

  Param.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    return data;
  }
}
