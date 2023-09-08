class PostListRequest {
  String? name;
  Param? param;

  PostListRequest({this.name, this.param});

  PostListRequest.fromJson(Map<String, dynamic> json) {
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
  String? listingType;

  Param({this.listingType});

  Param.fromJson(Map<String, dynamic> json) {
    listingType = json['listing_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_type'] = this.listingType;
    return data;
  }
}
