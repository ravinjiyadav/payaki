class CategoryListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  CategoryListResponse({this.status, this.code, this.message, this.data});

  CategoryListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['Message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? catId;
  String? catOrder;
  String? catName;
  String? slug;
  String? icon;
  String? picture;

  Data(
      {this.catId,
      this.catOrder,
      this.catName,
      this.slug,
      this.icon,
      this.picture});

  Data.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catOrder = json['cat_order'];
    catName = json['cat_name'];
    slug = json['slug'];
    icon = json['icon'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_order'] = this.catOrder;
    data['cat_name'] = this.catName;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['picture'] = this.picture;
    return data;
  }
}
