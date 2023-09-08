class SubCategoryListResponse {
  bool? status;
  int? code;
  String? message;
  List<Data>? data;

  SubCategoryListResponse({this.status, this.code, this.message, this.data});

  SubCategoryListResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic picture;
  String? subCatId;
  String? mainCatId;
  String? subCatName;
  String? photoShow;
  String? priceShow;

  Data(
      {this.catId,
        this.catOrder,
        this.catName,
        this.slug,
        this.icon,
        this.picture,
        this.subCatId,
        this.mainCatId,
        this.subCatName,
        this.photoShow,
        this.priceShow});

  Data.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catOrder = json['cat_order'];
    catName = json['cat_name'];
    slug = json['slug'];
    icon = json['icon'];
    picture = json['picture'];
    subCatId = json['sub_cat_id'];
    mainCatId = json['main_cat_id'];
    subCatName = json['sub_cat_name'];
    photoShow = json['photo_show'];
    priceShow = json['price_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_order'] = this.catOrder;
    data['cat_name'] = this.catName;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['picture'] = this.picture;
    data['sub_cat_id'] = this.subCatId;
    data['main_cat_id'] = this.mainCatId;
    data['sub_cat_name'] = this.subCatName;
    data['photo_show'] = this.photoShow;
    data['price_show'] = this.priceShow;
    return data;
  }
}
